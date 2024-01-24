#Marketing Campaign Performance Analysis📢
#The objective of this analysis is to uncover valuable insights regarding 
#campaign performance, audience preferences, channel effectiveness, and ROI. 
#By leveraging this dataset, marketers and data analysts can refine
#their marketing strategies, optimize campaigns, and drive targeted growth.

#Explore dataset
SELECT * FROM campaign;


#Company campaign wise the number of clicks generated,indicating user engagement.

SELECT company,SUM(clicks) user_engagement FROM campaign
GROUP BY 1
ORDER BY 2 DESC ;

#Pivot table use to analysis company campaign the number of clicks generated,indicating user engagement 
#through each specific segments wise
SELECT company,
         SUM(CASE WHEN customer_segment='Fashionistas' 
                   THEN clicks END) AS 'Fashionistas_cs',
            SUM(CASE WHEN customer_segment='Health & Wellness' 
                THEN clicks END) AS 'Health_wellness_cs',
                SUM(CASE WHEN customer_segment='Outdoor Adventurers'
                       THEN clicks END) AS 'Outdoor_cs',
              SUM(CASE WHEN customer_segment='Foodies' THEN clicks END) AS 'Foodies_cs',
                SUM(CASE WHEN customer_segment='Tech Enthusiasts'
                THEN clicks END) AS 'Tech_cs'
                FROM campaign
		GROUP BY 1
        ;

#Which company has invested high to acquire customer engagemnet for their campaign growth.

SELECT company,SUM(Acquistion_cost)  FROM campaign
GROUP BY 1
ORDER BY 2 DESC ;


#PIVOT TABLE is used company to analysis which age group influence for their campaign growth.

SELECT company,
         SUM(CASE WHEN Target_Audience='Men 18-24'
                   THEN Impressions END) AS 'MEN(18-24)',
            SUM(CASE WHEN Target_Audience='Women 35-44'
                THEN Impressions END) AS 'Women(35-44)',
                SUM(CASE WHEN Target_Audience='Men 25-34'
                       THEN Impressions END) AS 'Men(25-34)',
              SUM(CASE WHEN Target_Audience='All Ages' THEN Impressions END) AS 'All',
                SUM(CASE WHEN Target_Audience='Women 25-34'
                THEN Impressions END) AS 'Women(25-34)'
                FROM campaign
		GROUP BY 1
        ;
        

#PIVOT TABLE is used company to analysis which particular age group got their more  user engagement.
SELECT company,
         SUM(CASE WHEN Target_Audience='Men 18-24'
                   THEN clicks END) AS 'MEN(18-24)',
            SUM(CASE WHEN Target_Audience='Women 35-44'
                THEN clicks END) AS 'Women(35-44)',
                SUM(CASE WHEN Target_Audience='Men 25-34'
                       THEN clicks END) AS 'Men(25-34)',
              SUM(CASE WHEN Target_Audience='All Ages' THEN clicks END) AS 'All',
                SUM(CASE WHEN Target_Audience='Women 25-34'
                THEN clicks END) AS 'Women(25-34)'
                FROM campaign
		GROUP BY 1
        ;
        

#Company who got highest ROI ,success of the campaign and average ROI (return rate of investement)

SELECT company,ROUND(SUM(ROI),2) total_ROI, ROUND(AVG(ROI),2)  avg_ROI FROM campaign
GROUP BY 1
ORDER BY 2 DESC ;



#TOP Company leads and impressions which able  converted into desired actions, indicating campaign effectiveness.
SELECT company,
 ROUND(SUM(Conversion_Rate),2) total_Conversion_Rate FROM campaign
GROUP BY 1
ORDER BY 2 DESC;


#Which Particular Channel help to specific company able to promote company campaign, 
#to get company's desirable user engagement for growth.

SELECT company,
         SUM(CASE WHEN Channel_Used='Website'

                   THEN clicks END) AS 'Website',
            SUM(CASE WHEN Channel_Used='Facebook'
                THEN clicks END) AS 'Facebook',
                SUM(CASE WHEN Channel_Used='YouTube'
                       THEN clicks END) AS 'YouTube',
              SUM(CASE WHEN Channel_Used='Email' THEN clicks END) AS 'Email',
                SUM(CASE WHEN Channel_Used='Instagram'
                THEN clicks END) AS 'Instagram',
                 SUM(CASE WHEN Channel_Used='Google Ads'
                THEN clicks END) AS 'GoogleADS'
                FROM campaign
		GROUP BY 1
        ORDER BY 2 DESC;






