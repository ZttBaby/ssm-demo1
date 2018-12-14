package com.qf.admin.util;

public class PageInfo {
    /*
     * 分页技术需要解决的五个问题：JavaBean  业务Bean
     * 一共有几个商品
     * 一页要显示几个商品
     * 一共有几页
     * 当前是第几页
     * 当前页的所有商品
     */
    private int totalCount;//商品总数
    private int pageSize;//每页显示的商品数量
//    private int totalPage;//一共有几页
    private int pageIndex;//当前是第几页
//    private int offset;//当前页的所有商品
    private String search;

    public String getSearch() {
        return search;
    }

    public void setSearch(String search) {
        this.search = search;
    }

    public int getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getOffset() {
        return (pageIndex-1) * pageSize;
    }

    public int getTotalPage() {
        return (int) Math.ceil(totalCount*1.0/pageSize);
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }
}
