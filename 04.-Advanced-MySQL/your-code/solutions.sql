# Database
USE publications;

# Challenge 1 - Most Profiting Authors
## Step 1
CREATE TEMPORARY TABLE publications.royalties_per_sale
SELECT ta.au_id AS AuthorID, s.title_id AS TitleID,
(t.price * s.qty) * (t.royalty / 100) * (ta.royaltyper / 100) AS RoyaltyPerSale
FROM publications.sales s
INNER JOIN publications.titles t ON s.title_id = t.title_id
INNER JOIN publications.titleauthor ta ON t.title_id = ta.title_id;

## Step 2
CREATE TEMPORARY TABLE publications.royalties_per_title_and_author
SELECT AuthorID, TitleID, SUM(RoyaltyPerSale) AS RoyaltyPerTitleAndAuthor
FROM publications.royalties_per_sale
GROUP BY TitleID, AuthorID;

## Step 3
CREATE TEMPORARY TABLE publications.advance_per_author
SELECT ta.au_id AS AuthorID, SUM(t.advance * (ta.royaltyper / 100)) AS TotalAdvance
FROM publications.titles t
INNER JOIN publications.titleauthor ta ON t.title_id = ta.title_id
GROUP BY AuthorID;

CREATE TEMPORARY TABLE publications.royalty_per_author
SELECT AuthorID, SUM(RoyaltyPerTitleAndAuthor) AS TotalRoyalty
FROM publications.royalties_per_title_and_author
GROUP BY AuthorID;

SELECT apa.AuthorID, ROUND(TotalRoyalty + TotalAdvance,2) AS Profit
FROM royalty_per_author rpa
INNER JOIN publications.advance_per_author apa ON apa.AuthorID = rpa.AuthorID
ORDER BY Profit DESC
LIMIT 3;

# Challenge 2 - Alternative Solution

## Step 3
SELECT apa.AuthorID, ROUND(TotalRoyalty + TotalAdvance,2) AS Profit
FROM (
  SELECT AuthorID, SUM(RoyaltyPerTitleAndAuthor) AS TotalRoyalty
  FROM (
    ## Step 2
    SELECT AuthorID, TitleID, SUM(RoyaltyPerSale) AS RoyaltyPerTitleAndAuthor
    FROM (
      ## Step 1
      SELECT ta.au_id AS AuthorID, s.title_id AS TitleID,
      (t.price * s.qty) * (t.royalty / 100) * (ta.royaltyper / 100) AS RoyaltyPerSale
      FROM publications.sales s
      INNER JOIN publications.titles t ON s.title_id = t.title_id
      INNER JOIN publications.titleauthor ta ON t.title_id = ta.title_id
    ) rps
    GROUP BY TitleID, AuthorID
  ) rptaa
  GROUP BY AuthorID
) rpa
INNER JOIN (
  SELECT ta.au_id AS AuthorID, SUM(t.advance * (ta.royaltyper / 100)) AS TotalAdvance
  FROM publications.titles t
  INNER JOIN publications.titleauthor ta ON t.title_id = ta.title_id
  GROUP BY AuthorID
) apa ON apa.AuthorID = rpa.AuthorID
ORDER BY Profit DESC
LIMIT 3

# Challenge 3 - Create A Permanent Table Of The Most Profiting Authors
CREATE TABLE publications.most_profiting_authors
SELECT rpa.AuthorID, ROUND(TotalRoyalty + TotalAdvance,2) AS Profit
FROM royalty_per_author rpa
INNER JOIN publications.advance_per_author apa ON apa.AuthorID = rpa.AuthorID;