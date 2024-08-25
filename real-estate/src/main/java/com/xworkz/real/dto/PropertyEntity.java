package com.xworkz.real.dto;

import lombok.*;
import javax.persistence.*;
import java.util.List;


@Entity
@Getter
@Setter
@Table(name = "property")
@AllArgsConstructor
@NoArgsConstructor

@NamedQueries(
        {
            @NamedQuery(name = "getListOfProperties", query = "select pr from PropertyEntity pr where not pr.userEntity.userId=:Id order by pr.propertyId asc ") ,
            @NamedQuery(name = "getListOfUnBidPropertiesForReview",
                    query = "select pr from PropertyEntity pr where pr.userEntity.userId=:Id and " +
                            "pr.propertyId not In (select be.propertyEntities.propertyId from BidEntity be)")
        }
)


public class PropertyEntity {

    public PropertyEntity(int propertyId){
        this.propertyId = propertyId;
    }

    @Override
    public String toString() {
        return "propertyId = "+propertyId+
                ", propertyName = "+propertyName+
                ", propertyType = "+propertyType+
                ", propertyAddress ="+propertyAddress+
                ", propertyArea"+propertyArea+
                ", propertyPrice ="+propertyPrice;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "property_id")
    private Integer propertyId;

    @Column(name = "property_name")
    private String propertyName;

    @Column(name = "property_Type")
    private String propertyType;

    @Column(name = "property_address")
    private String propertyAddress;

    @Column(name = "property_area")
    private long propertyArea;

    @Column(name = "property_price")
    private long propertyPrice;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id")
    private UserEntity userEntity;

    @OneToMany(mappedBy = "propertyEntities")
    private List<BidEntity> bidEntity;

    public PropertyEntity(String propertyName, String propertyType, String propertyAddress, long propertyArea, long propertyPrice , UserEntity userEntity){
        this.propertyName = propertyName;
        this.propertyType = propertyType;
        this.propertyAddress = propertyAddress;
        this.propertyArea = propertyArea;
        this.propertyPrice = propertyPrice;
        this.userEntity = userEntity;
    }

}
