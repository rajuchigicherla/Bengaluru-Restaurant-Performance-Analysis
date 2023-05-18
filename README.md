
# Bengaluru-Restaurant-Performance-Analysis

<p align="center">
  <img src="https://github.com/rajuchigicherla/Bengaluru-Restaurant-Performance-Analysis/assets/118670053/eae9d1fd-e41f-464a-b8d0-e20e3078b675" >
</p>


**Wait!**

Before we go deep into the project I would like to say my sincere gratitude towards the **Hicounselor** team. They provided the ingredients required for this project also created random teams with the registered members.

Let's introduce my beloved teammates
- **Sirajul Hussain** 
- **Pranav** 
- Me(**Raju**) 

 Finally, I wish my teammates to have a great career ahead and had a great time collaborating with them and getting real-time experience on how to work as a team which gave me invaluable experience and a ton of experience not only on technical skills but also how to communicate in a collaborative environment.

Yeah! now we'll deep dive into the project



**Please hang on till the end you'll have a great time reading it.**

## Context

Bangalore, which is also known as Bengaluru, is the capital of the Indian state of Karnataka. Bangalore is the third-largest city in India and 27th largest city in the world. Bangalore is known as the `Silicon Valley` of India because of its position as the nation's `leading IT exporter` however Bangalore has a great `food culture`. It is also the city of sumptuous and mouth-watering delicacies that you just can’t say no to! Restaurants of various kinds of cuisines can be found here in Bangalore. Bangalore is sometimes referred to Best place for foodies. The food industry is always at a rise in Bangalore.

 ## Business Problem
 
 Bengaluru is known for it's great food culture **Zomato**, one of the most popular food ordering platforms wants **to analyze the performance of the restaurants** for growing their business.
 
In this project, you will be working on a **real-world dataset** of Zomato provided by **Hicounselor**. This project aims to clean the dataset, analyze the given dataset and mine informational-quality insights. This project also involves visualizing the data to better understand the restaurant’s performance.

The idea of analyzing the Zomato data set is to get some useful insights into the factors affecting the establishment of various types of restaurants in Bangalore. We also get a fair idea about the aggregate rating of each restaurant at different places in Bangalore. Bangalore is a city that has more than 12000 restaurants, serving different dishes from all over the world. New restaurants are opening, the industry hasn't been saturated yet, and the demand is increasing day by day. It has become so difficult for those new restaurants to compete with well-established restaurants. Most of them serve the same food. Bengaluru being the IT capital of India, most of the people here are dependent mainly on restaurant food as they don’t have time to cook for themselves. The growing number of restaurants and dishes in Bangalore is what attracts me to inspect the data to get some insights, interesting facts, and figures.

## Data Description
our dataset has below columns
1.    address
2.    name
3.    online_order
4.    book_table
5.    rating
6.    phone_number
7.    votes
8.    location
9.    rest_type
10.    dish_liked
11.    cuisines
12.    approx_cost_for_two
13.    type

## Roadmap

- Pre-processing  
- Exploratory Data Analysis 
- Dashboard 
- Uncovering Quality Insights
- Data-driven recommendations

 
 **Note**: All preprocessing tasks and exploratory data analysis were conducted using **SQL**
 
## Pre-processing
The following tasks were completed to preprocess the data

### Removing Unwanted Columns which are are not required for the business problem

**phone_number** and **address** column are not required for the business statement

### Renaming and Selecting Columns in a Dataset

name      : restaurant_name
rest_type : restaurant_type
 type     : dining_type

### Dealing with Null Values in a Dataset
- delete null values of name column as name is the primary identifier of the dataset
 - replace null values of online order with NA
- replace null values of book_table with NA
- replace null values of rating to zero as it is a numerical datatype
- replace null values of votes to zero as it is a numerical datatype
- replace null values of location to NA
- replace null values of rest_type to NA
- replace null values of dishliked to NA
- replace null values of cuisines to NA
- replace null values of approxcost to 0 as it is a numerical value
- replace null values of type to NA

### Identifying Duplicate Data in a Dataset

Drop all the duplicate values keeping the first value as it is

### Text Cleaning

   - we have irrelevant reviews like string eg(RATED,Rated) in our name,online_order etc columns
    - remove this irrelevant text from all the columns
    
### Unique Value Check and Irrelevant Value Handling
- 
- online order column should have only yes and no because it is necessary to have the online order as yes or no only for zomato to perform further analysis, remove other values
- check for rating column and remove NEW,- values to 0 and remove /5 as rating column should only contain decimal values
 - remove the unknown character from the dataset, we have Ã charachter in our names column  

 ## Exploratory Data Analysis
    
To gain some initial insghts before we do actual analysis to understand the broader managerial perspective conducted exploratory data analysis using SQL

EDA file was uploaded within the repository

## Dashboard

We prepared a dashboard to understand the performance of restaurants

Before making the dashboard we performed following tasks 

created  following `measure values` to calculate  KPIs which give an high level understanding how restaurants performing in the city using `DAX queries`
and then built a simple understandable dashboard

- online_order%
- book_table%
- average_rating
- votes_count
- average_cost_for_two


Here's the  dashboard

https://www.loom.com/share/6657c9905f17481abd7b6b233f34ac02

## Key Insights

#### Online Ordering and Table Booking:

- A majority of restaurants, around 60%, accept online orders, offering convenience and ease to customers.
- Surprisingly, only 15% of restaurants provide the option of table booking, limiting the choices for those seeking reserved dining experiences.
- 
#### Average Cost for Two Persons:

Indulging in a meal for two people, on average, amounts to 584 rupees, making it a reasonably affordable option.

#### Restaurant Ratings in Bengaluru:

The overall average rating for restaurants in Bengaluru stands at a modest 3.15, indicating room for improvement across the city's dining establishments.

#### Popular Restaurant Types:

- Quickbites and casual dining establishments hold the crown as the most popular restaurant types in Bengaluru, with approximately 58% of restaurants offering either quick bites or casual dining experiences, or both.

- Burger King emerges as the leading restaurant for quick bites, while Empire Restaurant takes the spotlight for casual dining.

#### Delivery and Dine-Out Preferences:

- An overwhelming 85% of individuals prefer either delivery or dine-out options, as 80% of restaurants provide one or both of these services.
- Digging deeper, delivery is the preferred choice for 47% of customers, showcasing a 10% margin over dine-out preferences.
- The appeal of delivery lies in its affordability, with an average cost for two amounting to 466 rupees, compared to the higher cost of dine-out experiences at 583 rupees.
- Furthermore, 73% of delivery orders are placed online, while for dine-out, the figure drops to 51%.

#### Popular Restaurant Chains:

- Onesta takes the crown as the most popular restaurant chain, attracting the highest number of customers, closely followed by Empire Restaurant and Truffles.
Popular Cuisines in Bengaluru:
- North Indian and South Indian cuisines reign supreme in Bengaluru, with Oye Amritsir and Gramin standing out as popular restaurant chains catering to these culinary preferences.
- Additionally, deserts are also highly sought-after, with North Indian cuisine following suit.

#### Popular Locations for Dining:

- Koramangala 5th Block emerges as the most popular location for enjoying a meal, followed by Indiranagar, Church Street, Koramangala 4th Block, and JP Nagar.
Top-Rated Locations:
- St. Mark Road holds the distinction of being the top-rated location, closely followed by Lavelle Road, Koramangala 5th Block, and Cunningham Road.

#### The Best Location in Bengaluru:

- Koramangala 5th Block not only proves to be the most popular but also receives top ratings, making it the best location for dining in Bengaluru.
- Impressively, this location has amassed a staggering 1.53 million votes, signifying an extensive customer base.
- The cost for two persons here is slightly higher than the overall average, but the exceptional ratings and availability of table booking are more than double the citywide average. Moreover, the prevalence of online ordering aligns with the overall trend.
- Casual dining takes the lead as the most favored restaurant type in Koramangala 5th Block, closely followed by cafes and quick bites.
- Truffles claims the title of the most popular restaurant chain in this location, followed by Black Pearl and Meghana Foods.


#### Impact of Table Booking Option:

**When table booking is available:**
- The average cost for two is 1267 rupees.
- The average rating is 4.06.
- Online ordering accounts for 57% of orders.


**When table booking is not available:**
- The average cost for two is 463 rupees.
- The average rating is 3.00.
- Online ordering accounts for 60% of orders.
- Surprisingly, despite higher costs, restaurants with table booking options received more votes (5.29 million) than those without (5.17 million).
- This suggests that customers prefer to book tables even if the overall cost is higher.


#### Restaurants Accepting Online Orders:

Restaurants that accept online orders are more popular in all aspects, as mentioned in the table booking section.

## Recommendations

#### Encourage More Restaurants to Accept Online Orders:

- Highlight the convenience and ease of online ordering to restaurants that have not yet adopted this feature.
- Emphasize the potential increase in customer reach and sales by offering online ordering services.
- Provide support and resources to assist restaurants in implementing online ordering systems.
- 
#### Promote and Expand Table Booking Services:

- Educate restaurants about the benefits of offering table booking options, such as attracting customers seeking reserved dining experiences.
- Collaborate with popular restaurants to showcase the advantages of table booking through success stories and testimonials.
- Develop a user-friendly table booking platform within the Zomato app to encourage more restaurants to join.

#### Provide Incentives for Affordable Dining Options:

- Collaborate with budget-friendly restaurants to offer exclusive discounts or promotions for Zomato users.
- Highlight the average cost for two persons in marketing campaigns, emphasizing the affordability of dining experiences available on Zomato.

#### Enhance Restaurant Ratings and Reviews:

- Encourage users to provide detailed and constructive feedback on their dining experiences through incentives such as loyalty points or discounts.
- Collaborate with restaurants to address any negative feedback and improve their overall ratings.
- Develop a robust rating system that factors in various aspects of the dining experience, such as food quality, service, and ambiance.

#### Showcase Popular Restaurant Types and Chains:

- Promote quick bites and casual dining experiences as preferred options in Bengaluru through targeted marketing campaigns.
- Feature popular restaurant chains like Onesta, Empire Restaurant, and Truffles prominently on the Zomato platform to increase their visibility and attract more customers.
#### Highlight Diverse Cuisine Options:

- Collaborate with North Indian and South Indian restaurant chains such as Oye Amritsir and Gramin to showcase their unique offerings.
- Emphasize the popularity of desserts in Bengaluru, promoting a wide range of dessert options available on the Zomato platform.

#### Curate Dining Experiences in Popular Locations:

- Develop curated dining experiences in the most popular locations, such as Koramangala 5th Block, Indiranagar, and Church Street.
- Partner with restaurants in these areas to offer exclusive menus, discounts, or themed events to attract more customers.

#### Promote the Best Location - Koramangala 5th Block:

- Highlight Koramangala 5th Block as the best location for dining in Bengaluru due to its popularity, top ratings, and availability of table booking options.
- Feature restaurants in this area prominently on the Zomato app and website, showcasing their unique offerings and encouraging customer reservations.

#### Leverage the Impact of Table Booking:

- Highlight the preference for table booking among customers despite higher costs.
- Educate restaurants on the potential benefits of offering table booking, such as increased customer satisfaction and loyalty.

#### Enhance Online Ordering Services:

- Continuously improve the online ordering experience by streamlining the process and providing prompt and reliable delivery services.
- Offer exclusive deals or discounts for online orders to encourage more customers to choose this option.


By implementing these recommendations, Zomato can enhance its platform, attract more customers, and facilitate the growth of the restaurant industry in Bengaluru.



