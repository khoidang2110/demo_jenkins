# Sử dụng Node.js phiên bản chính thức
FROM node:16

# Tạo thư mục ứng dụng
WORKDIR /app

# Sao chép file package.json và package-lock.json (nếu có)
COPY package*.json ./

# Cài đặt các dependency
RUN npm install

# Sao chép toàn bộ mã nguồn vào container
COPY . .

# Lắng nghe cổng 3000
EXPOSE 3000

# Khởi động ứng dụng
CMD ["node", "index.js"]
