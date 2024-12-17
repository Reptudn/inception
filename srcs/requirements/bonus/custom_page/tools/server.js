const express = require('express');
const path = require('path');
const app = express();

const PORT = 4242;

app.use(express.static(path.join(__dirname, 'app/public')));

app.use('/node_modules', express.static(path.join(__dirname, 'node_modules')));

app.listen(PORT, () => {
	console.log(`Server is running on http://localhost:${PORT}`);
});