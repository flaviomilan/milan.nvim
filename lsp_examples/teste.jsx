import React, { useState } from 'react';

const ComplexApp = () => {
  const [name, setName] = useState('');

  const handleChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setName(event.target.value);
  };

  return (
    <div>
      <input type="text" value={name} onChange={handleChange} />
      <p>Hello, {name}! Welcome to the complex TypeScript JSX program.</p>
    </div>
  );
};

export default ComplexApp;

