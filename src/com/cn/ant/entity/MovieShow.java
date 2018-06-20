package com.cn.ant.entity;

import java.util.Date;

public class MovieShow {
    private Integer sId;

    private Integer hId;

    private Integer mId;

    private Date sTime;

    private Integer sOnSale;
    
    private MovieHall moviehall;
    
    private Movie movie;

    public MovieHall getMoviehall() {
		return moviehall;
	}

	public void setMoviehall(MovieHall moviehall) {
		this.moviehall = moviehall;
	}

	public Movie getMovie() {
		return movie;
	}

	public void setMovie(Movie movie) {
		this.movie = movie;
	}

	public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }

    public Integer gethId() {
        return hId;
    }

    public void sethId(Integer hId) {
        this.hId = hId;
    }

    public Integer getmId() {
        return mId;
    }

    public void setmId(Integer mId) {
        this.mId = mId;
    }

    public Date getsTime() {
        return sTime;
    }

    public void setsTime(Date sTime) {
        this.sTime = sTime;
    }

    public Integer getsOnSale() {
        return sOnSale;
    }

    public void setsOnSale(Integer sOnSale) {
        this.sOnSale = sOnSale;
    }
}