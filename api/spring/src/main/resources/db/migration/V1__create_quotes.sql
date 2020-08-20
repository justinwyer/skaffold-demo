CREATE TABLE quotes
(
    id      INT AUTO_INCREMENT PRIMARY KEY,
    message TEXT,
    author  VARCHAR(128)
);

INSERT INTO quotes(message, author) VALUES
('When you have faults, do not fear to abandon them.', 'Confucius'),
('It does not matter how slowly you go so long as you do not stop.', 'Confucius'),
('Real knowledge is to know the extent of one''s ignorance.', 'Confucius'),
('Do not use a cannon to kill a mosquito.', 'Confucius'),
('Quality is not an act, it is a habit.', 'Aristotle'),
('Probable impossibilities are to be preferred to improbable possibilities.', 'Aristotle')

