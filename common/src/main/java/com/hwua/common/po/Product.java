package com.hwua.common.po;

public class Product {
    private Integer id;
    private String picture;
    private Integer brand_id;
    private Integer inventory;
    private String describes;
    private String category_id;
    private String pname;
    private Double xprice;
    private Double yprice;
    private Integer status;
    private String isput;

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", picture='" + picture + '\'' +
                ", brand_id=" + brand_id +
                ", inventory=" + inventory +
                ", describes='" + describes + '\'' +
                ", category_id='" + category_id + '\'' +
                ", pname='" + pname + '\'' +
                ", xprice=" + xprice +
                ", yprice=" + yprice +
                ", status=" + status +
                ", isput=" + isput +
                '}';
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getIsput() {
        return isput;
    }

    public void setIsput(String isput) {
        this.isput = isput;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public Integer getBrand_id() {
        return brand_id;
    }

    public void setBrand_id(Integer brand_id) {
        this.brand_id = brand_id;
    }

    public Integer getInventory() {
        return inventory;
    }

    public void setInventory(Integer inventory) {
        this.inventory = inventory;
    }

    public String getDescribes() {
        return describes;
    }

    public void setDescribes(String describes) {
        this.describes = describes;
    }

    public String getCategory_id() {
        return category_id;
    }

    public void setCategory_id(String category_id) {
        this.category_id = category_id;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public Double getXprice() {
        return xprice;
    }

    public void setXprice(Double xprice) {
        this.xprice = xprice;
    }

    public Double getYprice() {
        return yprice;
    }

    public void setYprice(Double yprice) {
        this.yprice = yprice;
    }
}
