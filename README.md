# Dynamic Accordion List View

![sobjectaccordionlistview](https://cdn-images-1.medium.com/max/1200/1*cJ2Lj9us2OgRiifp9uQfDQ.png)

There are 4 properties you can set:
*SOQL String:* This is just a normal SOQL query. Parent and child relationships are not supported. If you need a value from a Parent object I recommend creating a formula field. The SOQL query is dynamic so you can use most objects. The fields in the SOQL query are displayed in the expandable section of the Accordion.

Example: Select Name, FirstName, LastName, Email, Description FROM Contact Limit 50

*Name Field:* This is the section header value. The SOQL String must contain this field. Must use the API Name of the fields. This removes the field from the section part of the Accordion.

Example: Name.

*Image Field:* Optional. The SOQL String must contain this field. Must use the API Name of the fields.

*Background Colour:* I would leave this white. I tried to include the functionality to change the text colour but working with lightning components is just too hard.


![adminconfig](https://cdn-images-1.medium.com/max/1200/1*qBt3T7OUYGmvmFFwB1bANA.png)

