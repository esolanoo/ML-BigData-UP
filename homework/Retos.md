# 2<sup>nd</sup> Homework

## Challenges

*Eduardo Solano Jaime | 0213663*

---

### 1<sup>st</sup> Challenge

Show the most expensive products for each brand, as well as its average price.

> My approach: linking each article to its manufacturer using the JOIN statement, then calculating the maximum and average prices for each manufacturer's articles using max(a.price) and avg(a.price).

```SQL
SELECT m.title AS "Brand", max(a.price) AS max_price, avg(a.price) AS avg_price 
FROM articles a
JOIN manufacturers m ON m.id=a.manufacturer_id
GROUP BY m.id=
```

|    | Brand        |   max_price |   avg_price |
|---:|:-------------|------------:|------------:|
|  0 | ARUBA        |        2309 |     2309    |
|  1 | IMOU         |        1649 |     1649    |
|  2 | BROTHER      |       27569 |     7924.4  |
|  3 | SPARKFUN     |          55 |       55    |
|  4 | DELL         |      128829 |    21516.3  |
|  5 | LINKEDPRO    |        5399 |     2174.83 |
|  6 | StarTech.com |       22829 |     5292.57 |
|  7 | ACCO         |        1359 |      944    |
|  8 | LITE-ON      |         361 |      361    |
|  9 | ALIEN        |        6959 |     3690.5  |

### 2<sup>nd</sup> Challenge

Query to show how many products exist by category.

>My strategy: linking each article to its manufacturer using the JOIN statement, then counting the number of articles for each manufacturer using count(a.id)

```SQL
SELECT m.title as "Category", count(a.id) AS "Article count"
FROM articles a
JOIN manufacturers m ON m.id=a.manufacturer_id
GROUP BY m.id
```

|    | Category     |   Article count |
|---:|:-------------|----------------:|
|  0 | ARUBA        |               1 |
|  1 | IMOU         |               1 |
|  2 | BROTHER      |               5 |
|  3 | SPARKFUN     |               1 |
|  4 | DELL         |             184 |
|  5 | LINKEDPRO    |               6 |
|  6 | StarTech.com |               7 |
|  7 | ACCO         |               2 |
|  8 | LITE-ON      |               1 |
|  9 | ALIEN        |               2 |
|... | ...          |             ... |

### 3<sup>rd</sup> Challenge

Idem brand

>My strategy: linking each article to its manufacturer using the JOIN statement, then counting the number of articles for each brand using count(a.id)

```SQL
SELECT m.title as "Brand", count(a.id) AS "Article count"
FROM articles a
JOIN manufacturers m ON m.id=a.manufacturer_id
GROUP BY m.id;
```

|    | Brand     |   Article count |
|---:|:-------------|----------------:|
|  0 | ARUBA        |               1 |
|  1 | IMOU         |               1 |
|  2 | BROTHER      |               5 |
|  3 | SPARKFUN     |               1 |
|  4 | DELL         |             184 |
|  5 | LINKEDPRO    |               6 |
|  6 | StarTech.com |               7 |
|  7 | ACCO         |               2 |
|  8 | LITE-ON      |               1 |
|  9 | ALIEN        |               2 |
| ...| ...          |             ... |

### 4<sup>th</sup> Challenge

Show the top 5 most relevant products by brand.

> My strategy: joining the articles and manufacturers tables to get the product names (a.title) and brand names (m.title). Then, it uses the ROW_NUMBER() window function to assign a rank to each product within its brand, ordering by price in descending order (ORDER BY a.price DESC). It filters the results to only include products with a rank less than or equal to 5 (rn <= 5). Finally, it groups the results by brand (GROUP BY Brand) and uses GROUP_CONCAT(Product SEPARATOR ', ') to concatenate the product names for each brand, separated by a comma and a space.

```SQL
SELECT
    Brand,
    GROUP_CONCAT(Product SEPARATOR ', ') AS Products
FROM (
    SELECT
        a.title AS "Product",
        m.title AS "Brand",
        ROW_NUMBER() OVER (PARTITION BY m.id ORDER BY a.price DESC) AS rn
    FROM
        articles a
        JOIN manufacturers m ON m.id = a.manufacturer_id
) AS ranked_products
WHERE
    rn <= 5
GROUP BY
    Brand;
```

|    | Brand      | Products |
|---:|:-----------|:---------|
|  0 | ABB        | ABB Interruptor Termomagnético 3 Polos 1SDA067435R1, 690V, 125A, Entrada 500V, ABB Relevador de Apertura con Cableado, 240V, para T4/T5/T6|
|  1 | ACCESSPRO  | AccessPro Torniquete Bidireccional AP5000HD, 98cm, Acero Inoxidable, AccessPRO Semáforo Peatonal con Movimiento Verde/Rojo PROLIGHTPASD, AccessPRO Brazo Articulado para Barreras XBS-4M-RA/XBS-4M-LA, 4 Metros, AccessPro Picos Poncha LLantas para Barrera Vehicular XB-TK-1M, 100cm, Amarillo, AccessPRO Detector Fotoeléctrico XBS-RR7, 7 Metros |
|  2 | ACCO       | Acco Foliador Royall de 7 Dígitos RNM7A-7, Negro, Acco Separador 442, 5 Divisiones, Blanco |
|  3 | ACER       | Laptop Acer Porsche Design 14" Full HD, Intel Core i5-1135G7 2.40GHz, 8GB, 512GB SSD, Windows 10 Home 64-bit, Negro/Plata, Laptop Gamer Acer Nitro 5 AN515-58-77Z2 15.6" Full HD, Intel Core i7-12700H 3.50GHz, 16GB, 1TB + 512GB SSD, NVIDIA GeForce RTX 3060, Windows 11 Home 64-bit, Negro, Laptop Gamer Acer AN515-55-7581 15.6" Full HD, Intel Core i7-10750H 2.60GHz, 8GB, 512GB, NVIDIA GeForce RTX 3060, Windows 10 Home 64-bit, Español, Negro, Laptop Acer Travelmate P6 14" HD, Intel Core i7-10510U 1.80GHz, 8GB, 1TB SSD, Windows 10 Pro 64-bit, Español, Negro, Laptop Acer Triton 300 SE PT314-51s-71UU 14" Full HD, Intel Core i7-11375H 3.30GHz, 16GB, 512GB SSD, NVIDIA GeForce RTX 3060, Windows 10 Home 64-bit, Inglés, Plata |
|  4 | ACTECK     | Acteck Smartwatch Motion Sport SW250, Touch, Bluetooth 5.0, Android/iOS, Negro - Resistente a Salpicaduras y Polvo, Acteck Lector de Memoria DH450, MicroSD, USB A/C, Negro, Acteck Adaptador Divisor Splitter de Audífonos, 3.5mm Hembra - 2x 3.5mm Macho, |
|... | ... | ... |
| 262 | ZEBRA   | Zebra Impresora Móvil ZQ630, Térmica Directa, Inalámbrico, 203 x 203DPI, Ethernet, Bluetooth, USB, Serial, Negro, Zebra Panel de control, para ZT510, Zebra Card Studio 2.0, 1 Licencia Estándar, Windows, Zebra Kit de Mantenimiento, Cartucho de Alimentación para ZXP7, Zebra Kit de Montaje para XC6, Negro                       |
| 263 | ZKTECO  | ZKTeco Panel de Control inBio-460BOX para 4 Puertas, incluye Gabinete + Fuente, ZKTeco Control de Acceso y Asistencia Biométrico SpeedFace V5LP, 6.000 Rostros, 10.000 Huellas, RS-485, ZKTeco Monitor para Videoportero VDPI-B3, 7", Altavoz, Alámbrico, Blanco, ZKTeco Unidad de Respaldo de Energía para Lectores Biométricos, 12V |
