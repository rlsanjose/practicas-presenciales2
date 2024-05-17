package com.svalero.thecuriousfeather.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
    private int product_id;
    private String name;
    private float price;
    private int stock;
    private String image_url;
}
