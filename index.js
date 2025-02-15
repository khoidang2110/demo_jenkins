const express = require('express');
const app = express();
const port = 3000;

// Route trả về "Hello" khi truy cập trang chủ
app.get('/', (req, res) => {
  res.send('Hello');
});

// Lắng nghe trên cổng 3000
app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
