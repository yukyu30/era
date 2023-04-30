// src/components/CreateNoteForm.tsx
import React, { useState } from 'react';
import axios from 'axios';

interface CreateNoteFormProps {
  onNoteCreated: () => void;
}

const CreateNoteForm: React.FC<CreateNoteFormProps> = ({ onNoteCreated }) => {
  const [title, setTitle] = useState('');
  const [slug, setSlug] = useState('');
  const [eyecatch, setEyecatch] = useState('');
  const [content, setContent] = useState('');
  const [publishedAt, setPublishedAt] = useState('');

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    try {
      await axios.post('http://localhost:3000/notes', {
        note: {
          title,
          slug,
          eyecatch,
          content,
          published_at: publishedAt,
        },
      });

      setTitle('');
      setSlug('');
      setEyecatch('');
      setContent('');
      setPublishedAt('');

      if (onNoteCreated) {
        onNoteCreated();
      }
    } catch (error) {
      console.error('Error creating note:', error);
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <div>
        <label htmlFor="title">Title:</label>
        <input
          type="text"
          id="title"
          value={title}
          onChange={(e) => setTitle(e.target.value)}
          required
        />
      </div>
      <div>
        <label htmlFor="slug">Slug:</label>
        <input
          type="text"
          id="slug"
          value={slug}
          onChange={(e) => setSlug(e.target.value)}
          required
        />
      </div>
      <div>
        <label htmlFor="eyecatch">Eyecatch:</label>
        <input
          type="text"
          id="eyecatch"
          value={eyecatch}
          onChange={(e) => setEyecatch(e.target.value)}
        />
      </div>
      <div>
        <label htmlFor="content">Content:</label>
        <textarea
          id="content"
          value={content}
          onChange={(e) => setContent(e.target.value)}
          required
        ></textarea>
      </div>
      <div>
        <label htmlFor="published_at">Published At:</label>
        <input
          type="datetime-local"
          id="published_at"
          value={publishedAt}
          onChange={(e) => setPublishedAt(e.target.value)}
        />
      </div>
      <button type="submit">Create Note</button>
    </form>
  );
};
export default CreateNoteForm;
