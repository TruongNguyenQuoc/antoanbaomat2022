package com.example.shoesproject.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Role {

    private long id;
    private String name;
    private String description;

    public Role() {
    }

    public Role(long id, String name, String description) {
        this.id = id;
        this.name = name;
        this.description = description;
    }
}
