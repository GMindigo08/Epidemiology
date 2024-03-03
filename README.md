In each instance, you have connections from city to city (i.e., a network).  Some cities are connected to each other with multiple paths.  The weight of the path is the number of blocks connecting the cities (for reference, the length of the path from Anchorage to Montreal is 3).  We will consider the edges to be directed in the following way (alphabetically):

Light Gray – Ascending (unless there are two, then each one goes the opposite way)
White - Descending
Dark Gray - Ascending
Green - Descending
Yellow - Ascending
Blue - Descending
Purple - Descending
Red – Descending (with the exception of Anchorage to Los Angeles, which is ascending)
Orange - Ascending

![image_22379918121709229530435_20240229175852269](https://github.com/GMindigo08/Epidemiology/assets/137466455/dd7dd6b3-19de-421b-8b64-06337c09912b)
![Network](https://github.com/GMindigo08/Epidemiology/assets/137466455/331fffb8-4f91-4ed6-abdd-f433cd4a580e)

We have now figured out that there is a disease in the world and we want to stop it.  Our epidemiologist tells us that the best thing we can do is knock out the airplanes.  To do that, remove any purple or red edges from the map:

![Network Without Planes](https://github.com/GMindigo08/Epidemiology/assets/137466455/d1dd6ab6-c07c-4ea8-b6c5-ddba9b94eee0)

They have a change of heart and now tell you to knock out the trains instead.  To do that, knock out white and blue edges from this new map:

![Network Without Trains](https://github.com/GMindigo08/Epidemiology/assets/137466455/a4033223-638d-4143-a124-13daabdf58d5)
