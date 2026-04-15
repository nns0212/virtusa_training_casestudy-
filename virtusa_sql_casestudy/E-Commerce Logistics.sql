-- 1.Schema Design
CREATE TABLE Partners (
    PartnerID INT PRIMARY KEY,
    PartnerName VARCHAR(100)
);

CREATE TABLE Shipments (
    ShipmentID INT PRIMARY KEY,
    PartnerID INT,
    DestinationCity VARCHAR(100),
    PromisedDate DATE,
    ActualDeliveryDate DATE,
    FOREIGN KEY (PartnerID) REFERENCES Partners(PartnerID)
);

CREATE TABLE DeliveryLogs (
    LogID INT PRIMARY KEY,
    ShipmentID INT,
    Status VARCHAR(50),
    LogDate DATE,
    FOREIGN KEY (ShipmentID) REFERENCES Shipments(ShipmentID)
);

-- Dummy Data
INSERT INTO Partners VALUES
(1, 'FastTrack'),
(2, 'QuickMove'),
(3, 'ShipNow');

INSERT INTO Shipments VALUES
(101, 1, 'Hyderabad', '2026-04-01', '2026-04-03'), -- delayed
(102, 1, 'Bangalore', '2026-04-02', '2026-04-02'), -- on time
(103, 2, 'Hyderabad', '2026-04-05', '2026-04-06'), -- delayed
(104, 2, 'Chennai', '2026-03-20', '2026-03-25'), -- delayed
(105, 3, 'Hyderabad', '2026-04-10', '2026-04-10'), -- on time
(106, 3, 'Mumbai', '2026-03-15', '2026-03-20'); -- delayed

INSERT INTO DeliveryLogs VALUES
(1, 101, 'Delivered', '2026-04-03'),
(2, 102, 'Delivered', '2026-04-02'),
(3, 103, 'Delivered', '2026-04-06'),
(4, 104, 'Returned', '2026-03-25'),
(5, 105, 'Delivered', '2026-04-10'),
(6, 106, 'Returned', '2026-03-20');

-- 2.Delayed Shipment Query
SELECT ShipmentID, PartnerID, PromisedDate, ActualDeliveryDate
FROM Shipments
WHERE ActualDeliveryDate > PromisedDate;

-- 3.Performance Ranking
SELECT p.PartnerName, l.Status, COUNT(*) AS Total
FROM DeliveryLogs l
JOIN Shipments s ON l.ShipmentID = s.ShipmentID
JOIN Partners p ON s.PartnerID = p.PartnerID
GROUP BY p.PartnerName, l.Status;

-- 4.The "Zone" Filter
SELECT DestinationCity, COUNT(*) AS OrdersCount
FROM Shipments
WHERE PromisedDate >= CURDATE() - INTERVAL 30 DAY
GROUP BY DestinationCity
ORDER BY OrdersCount DESC
LIMIT 1;

-- 5.Partner Scorecard
SELECT p.PartnerName,
       COUNT(CASE WHEN s.ActualDeliveryDate > s.PromisedDate THEN 1 END) AS Delays
FROM Partners p
JOIN Shipments s ON p.PartnerID = s.PartnerID
GROUP BY p.PartnerName
ORDER BY Delays ASC;