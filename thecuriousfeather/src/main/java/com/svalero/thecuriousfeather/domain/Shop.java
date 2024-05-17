package com.svalero.thecuriousfeather.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Shop {

    private int shop_id;
    private String address;
    private String city;
    private String opening_hours;
}
