package com.xworkz.real.dto;

import lombok.*;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Getter
@Setter
@Table(name = "bid")
@NoArgsConstructor
@AllArgsConstructor


@NamedQuery(name = "getListOfBidEntitiesForReview" ,
        query = "select be from BidEntity be where be.propertyEntities.propertyId= any (select pr.propertyId from PropertyEntity pr where pr.userEntity.userId =:Id) order by be.propertyEntities.propertyId asc, be.bidAmount desc ")

public class BidEntity {

    public BidEntity(int bidId){
        this.bidId = bidId;
    }

    @Override
    public String toString() {
        return "bidId = "+bidId+
                ", bidAmount = "+bidAmount+
                ", bidTime = "+bidTime;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "bid_Id")
    private int bidId;

    @Column(name = "bid_Amount")
    private long bidAmount;

    @Column(name = "bid_Time")
    private Timestamp bidTime;


    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "property_id")
    private PropertyEntity propertyEntities;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id")
    private UserEntity userEntities;

    public BidEntity(long bidAmount,Timestamp bidTime,PropertyEntity propertyEntity,UserEntity userEntities){
        this.bidAmount = bidAmount;
        this.bidTime = bidTime;
        this.propertyEntities = propertyEntity;
        this.userEntities = userEntities;
    }

}
