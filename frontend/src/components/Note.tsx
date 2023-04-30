import React from 'react';

interface NoteProps {
  id: number;
  title: string;
  slug: string;
  eyecatch?: string;
  content: string;
  published_at?: string;
  created_at: string;
  updated_at: string;
}

const Note = (props: NoteProps) => {
  return (
    <div>
      <h2>{props.title}</h2>
      <p>Slug: {props.slug}</p>
      <p>{props.eyecatch}</p>
      <p>{props.content}</p>
      {props.published_at && (
        <p>Published At: {new Date(props.published_at).toLocaleString()}</p>
      )}
    </div>
  );
};

export default Note;
