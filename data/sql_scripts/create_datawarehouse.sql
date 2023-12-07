DROP DATABASE IF EXISTS `food_nutrition`;
CREATE DATABASE `food_nutrition`; 
USE `food_nutrition`;
-- Use the InnoDB storage engine for foreign key support
SET default_storage_engine = 'InnoDB';
-- Create Restaurant Dimension
CREATE TABLE Dim_Restaurant (
    Restaurant_ID INT PRIMARY KEY AUTO_INCREMENT,
    Restaurant_Name VARCHAR(255) UNIQUE NOT NULL
);

-- Create Meal_type Dimension
CREATE TABLE Dim_Meal_type (
    Meal_Type_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) UNIQUE NOT NULL,
    Time_Of_Day VARCHAR(50),
    Caloric_Range VARCHAR(50)
);

-- Create Item Dimension
CREATE TABLE Dim_Item (
    Item_ID INT PRIMARY KEY AUTO_INCREMENT,
    Item_Name VARCHAR(255) NOT NULL,
    Ingredient TEXT
    
);

-- Create Nutritional Information Fact Table
CREATE TABLE Nutritional_Information (
    Fact_ID INT PRIMARY KEY AUTO_INCREMENT,
    Item_ID INT,
    Restaurant_ID INT,
    Calories INT,
    Cal_Fat INT,
    Total_Fat INT,
    Sat_Fat INT,
    Trans_Fat  DECIMAL(10, 2),
    Cholesterol INT,
    Sodium INT,
    Total_Carb INT,
    Fiber INT,
    Sugar INT,
    Protein INT,
    Vit_A INT,
    Vit_C INT,
    Calcium INT,
    Meal_Type VARCHAR(255)
);


ALTER TABLE Nutritional_Information
ADD CONSTRAINT fk_fact_item FOREIGN KEY (Item_ID) REFERENCES Dim_Item(Item_ID) ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT fk_fact_meal_type FOREIGN KEY (Meal_Type) REFERENCES Dim_Meal_type(Name) ON DELETE SET NULL ON UPDATE CASCADE,
ADD CONSTRAINT fk_fact_restaurant FOREIGN KEY (Restaurant_ID) REFERENCES Dim_Restaurant(Restaurant_ID) ON DELETE SET NULL ON UPDATE CASCADE;

