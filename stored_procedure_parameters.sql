USE classicmodels;

-- ==========================================
-- 1. THAM SỐ LOẠI IN (Tham số truyền vào)
-- ==========================================
DELIMITER //

CREATE PROCEDURE getCusById(IN cusNum INT)
BEGIN
    SELECT * FROM customers WHERE customerNumber = cusNum;
END //

DELIMITER ;

-- Gọi store procedure loại IN
CALL getCusById(175);


-- ==========================================
-- 2. THAM SỐ LOẠI OUT (Tham số trả về kết quả)
-- ==========================================
DELIMITER //

CREATE PROCEDURE GetCustomersCountByCity(
    IN in_city VARCHAR(50),
    OUT total INT
)
BEGIN
    SELECT COUNT(customerNumber)
    INTO total
    FROM customers
    WHERE city = in_city;
END//

DELIMITER ;

-- Gọi store procedure loại OUT
CALL GetCustomersCountByCity('Lyon', @total);
SELECT @total;


-- ==========================================
-- 3. THAM SỐ LOẠI INOUT (Vừa truyền vào vừa nhận kết quả thay đổi)
-- ==========================================
DELIMITER //

CREATE PROCEDURE SetCounter(
    INOUT counter INT,
    IN inc INT
)
BEGIN
    SET counter = counter + inc;
END//

DELIMITER ;

-- Gọi store procedure loại INOUT
SET @counter = 1;
CALL SetCounter(@counter, 1); -- Kết quả: 2
CALL SetCounter(@counter, 1); -- Kết quả: 3
CALL SetCounter(@counter, 5); -- Kết quả: 8
SELECT @counter; -- Kết quả cuối cùng: 8