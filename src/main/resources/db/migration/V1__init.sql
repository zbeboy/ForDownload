CREATE TABLE `address` (
  `addressID` int(11) NOT NULL,
  `city` varchar(55) NOT NULL,
  `street` varchar(55) NOT NULL,
  `zip` varchar(8) NOT NULL,
  PRIMARY KEY (`addressID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `address` VALUES ('1', '深圳', '坂田市场', '518001');
INSERT INTO `address` VALUES ('2', '深圳', '坂田路口', '518002');
INSERT INTO `address` VALUES ('3', '深圳', '四季花城', '518003');