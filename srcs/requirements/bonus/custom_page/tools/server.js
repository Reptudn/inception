const express = require('express');
const path = require('path');
const app = express();

const PORT = 4242;

app.use(express.static(path.join(__dirname, 'app/public/index.html')));
console.log(path.join(__dirname, 'app/public/index.html'));

app.listen(PORT, () => {
	console.log(`Server is running on http://localhost:${PORT}`);
});