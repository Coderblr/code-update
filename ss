"use client";

import { useState } from 'react';
import styles from './page.module.css'; // Import your CSS Module

export default function SocialAttributePage() {
  const [cif, setCif] = useState('');
  const [category, setCategory] = useState('');
  const [region, setRegion] = useState('');
  const [response, setResponse] = useState(null);
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);

  async function handleSubmit(e) {
    e.preventDefault();
    setLoading(true);
    setError('');
    setResponse(null);

    try {
      const res = await fetch('http://10.1.161/create_ckyc/', { // Replace with your actual backend URL
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          // If your API requires authentication, add the token here
          // 'Authorization': `Bearer ${localStorage.getItem('token')}`,
        },
        body: JSON.stringify({
          cif,
          category,
          region,
        }),
      });

      if (!res.ok) {
        const errorData = await res.json();
        throw new Error(errorData.detail || 'Failed to create social attribute');
      }

      const data = await res.json();
      setResponse(data);
    } catch (err) {
      setError(err.message);
      console.error("Error creating social attribute:", err);
    } finally {
      setLoading(false);
    }
  }

  return (
    <div className={styles.container}>
      <div className={styles.formContainer}>
        <h1 className={styles.title}>Create CKYC</h1>
        <form onSubmit={handleSubmit}>
          <div className={styles.formGroup}>
            <label htmlFor="cif" className={styles.label}>CIF:</label>
            <input
              type="text"
              id="cif"
              value={cif}
              onChange={(e) => setCif(e.target.value)}
              className={styles.formInput}
              required
            />
          </div>

          <div className={styles.formGroup}>
            <label htmlFor="category" className={styles.label}>Category:</label>
            <input
              type="text"
              id="category"
              value={category}
              onChange={(e) => setCategory(e.target.value)}
              className={styles.formInput}
              required
            />
          </div>

          <div className={styles.formGroup}>
            <label htmlFor="region" className={styles.label}>Region:</label>
            <input
              type="text"
              id="region"
              value={region}
              onChange={(e) => setRegion(e.target.value)}
              className={styles.formInput}
              required
            />
          </div>

          <button type="submit" className={styles.submitButton} disabled={loading}>
            {loading ? 'Submitting...' : 'Submit'}
          </button>
        </form>

        {error && <p className={styles.errorMessage}>Error: {error}</p>}

        {response && (
          <div className={styles.responseContainer}>
            <h2 className={styles.responseTitle}>API Response:</h2>
            <pre className={styles.responsePre}>
              {JSON.stringify(response, null, 2)}
            </pre>
          </div>
        )}
      </div>
    </div>
  );
}
"use client";

import { useState } from 'react';
import styles from './page.module.css'; // Import your CSS Module

export default function SocialAttributePage() {
  const [cif, setCif] = useState('');
  const [relcat, setRelcat] = useState('');
  const [region, setRegion] = useState('');
  const [response, setResponse] = useState(null);
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);

  async function handleSubmit(e) {
    e.preventDefault();
    setLoading(true);
    setError('');
    setResponse(null);

    try {
      const res = await fetch('http://10.1.161/social_attribute/', { // Replace with your actual backend URL
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          // If your API requires authentication, add the token here
          // 'Authorization': `Bearer ${localStorage.getItem('token')}`,
        },
        body: JSON.stringify({
          cif,
          relcat,
          region,
        }),
      });

      if (!res.ok) {
        const errorData = await res.json();
        throw new Error(errorData.detail || 'Failed to create social attribute');
      }

      const data = await res.json();
      setResponse(data);
    } catch (err) {
      setError(err.message);
      console.error("Error creating social attribute:", err);
    } finally {
      setLoading(false);
    }
  }

  return (
    <div className={styles.container}>
      <div className={styles.formContainer}>
        <h1 className={styles.title}>Create Social Attribute</h1>
        <form onSubmit={handleSubmit}>
          <div className={styles.formGroup}>
            <label htmlFor="cif" className={styles.label}>CIF:</label>
            <input
              type="text"
              id="cif"
              value={cif}
              onChange={(e) => setCif(e.target.value)}
              className={styles.formInput}
              required
            />
          </div>

          <div className={styles.formGroup}>
            <label htmlFor="relcat" className={styles.label}>Relcat:</label>
            <input
              type="text"
              id="relcat"
              value={relcat}
              onChange={(e) => setRelcat(e.target.value)}
              className={styles.formInput}
              required
            />
          </div>

          <div className={styles.formGroup}>
            <label htmlFor="region" className={styles.label}>Region:</label>
            <input
              type="text"
              id="region"
              value={region}
              onChange={(e) => setRegion(e.target.value)}
              className={styles.formInput}
              required
            />
          </div>

          <button type="submit" className={styles.submitButton} disabled={loading}>
            {loading ? 'Submitting...' : 'Submit'}
          </button>
        </form>

        {error && <p className={styles.errorMessage}>Error: {error}</p>}

        {response && (
          <div className={styles.responseContainer}>
            <h2 className={styles.responseTitle}>API Response:</h2>
            <pre className={styles.responsePre}>
              {JSON.stringify(response, null, 2)}
            </pre>
          </div>
        )}
      </div>
    </div>
  );
}
