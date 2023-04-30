import React, { useEffect, useState } from 'react';
import './App.css';
import Note from './components/Note';
import axios from 'axios';
import CreateNoteForm from './components/CreateNoteForm';

interface NoteData {
  id: number;
  title: string;
  slug: string;
  eyecatch?: string;
  content: string;
  published_at?: string;
  created_at: string;
  updated_at: string;
}

const App = () => {
  const [notes, setNotes] = useState<NoteData[]>([]);

  useEffect(() => {
    fetchNotes();
  }, []);

  const fetchNotes = async () => {
    try {
      const response = await axios.get<NoteData[]>(
        'http://localhost:3000/notes'
      );
      console.log(response.data);
      setNotes(response.data);
    } catch (error) {
      console.error('Error fetching data:', error);
    }
  };

  const handleNoteCreated = () => {
    fetchNotes();
  };

  return (
    <div>
      <h1>Notes</h1>
      <CreateNoteForm onNoteCreated={handleNoteCreated} />
      {notes.map((note) => (
        <Note
          key={note.id}
          id={note.id}
          title={note.title}
          eyecatch={note.eyecatch}
          content={note.content}
          slug={note.slug}
          created_at={note.created_at}
          updated_at={note.updated_at}
        />
      ))}
    </div>
  );
};
export default App;
