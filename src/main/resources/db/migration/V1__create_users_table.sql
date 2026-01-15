-- Create users table
CREATE TABLE users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100),
    role VARCHAR(20) DEFAULT 'USER',
    enabled BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_username (username),
    INDEX idx_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert default users (passwords are BCrypt encoded)
-- admin123 = $2a$10$N9qo8uLOickgx2ZMRZoMy.MqDn3RQDcXvGZwJvkNZCYvQvN3UVLe2
-- user123 = $2a$10$EqKcp1WFKs6SbXPXwH.FF.4.M1yjJvHFWTHpJR/VDbfRw9wkfLHXi
-- vk123 = $2a$10$8K.w5tKqB.tOIzq.CQPYA.Lv5d6Xe6P5AWYXK0fVdYgKVZJJi.S6u

INSERT INTO users (username, password, email, role, enabled) VALUES
('admin', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MqDn3RQDcXvGZwJvkNZCYvQvN3UVLe2', 'admin@vk.com', 'ADMIN', true),
('user', '$2a$10$EqKcp1WFKs6SbXPXwH.FF.4.M1yjJvHFWTHpJR/VDbfRw9wkfLHXi', 'user@vk.com', 'USER', true),
('vk', '$2a$10$8K.w5tKqB.tOIzq.CQPYA.Lv5d6Xe6P5AWYXK0fVdYgKVZJJi.S6u', 'vk@vk.com', 'ADMIN', true);
