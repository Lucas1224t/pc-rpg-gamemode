/*******************************************************************************
* FILENAME :        modules/objects/bank.pwn
*
* DESCRIPTION :
*       Creates a bank interior.
*
*       Copyright Paradise Devs 2015.  All rights reserved.
*
*/

#include <YSI\y_hooks>

hook OnGameModeInit()
{
    new floor[4];
	CreateDynamicObject(19453, 1590.59314, -1039.86035, 24.49502,   0.00000, 0.00000, 0.00000, 17);
	CreateDynamicObject(19453, 1609.86755, -1040.01672, 24.49514,   0.00000, 0.00000, 0.06000, 17);
	CreateDynamicObject(19453, 1605.12903, -1025.50378, 24.49502,   0.00000, 0.00000, 90.00000, 17);
	CreateDynamicObject(19453, 1605.08960, -1044.58923, 24.49502,   0.00000, 0.00000, 90.00000, 17);
	floor[0] = CreateDynamicObject(19377, 1594.57166, -1030.40247, 22.83450,   0.00000, 90.00000, 0.00000, 17);
	floor[1] = CreateDynamicObject(19377, 1594.93213, -1039.99292, 22.83450,   0.00000, 90.00000, 0.00000, 17);
	floor[2] = CreateDynamicObject(19377, 1605.04492, -1030.38110, 22.83450,   0.00000, 90.00000, 0.00000, 17);
	floor[3] = CreateDynamicObject(19377, 1605.40137, -1040.00818, 22.83450,   0.00000, 90.00000, 0.00000, 17);
	CreateDynamicObject(19453, 1609.86707, -1030.39246, 24.49502,   0.00000, 0.00000, 0.00000, 17);
	CreateDynamicObject(19453, 1590.59302, -1030.22998, 24.49502,   0.00000, 0.00000, 0.00000, 17);
	CreateDynamicObject(19453, 1595.50000, -1025.50378, 24.49502,   0.00000, 0.00000, 90.00000, 17);
	CreateDynamicObject(19453, 1595.47705, -1044.58765, 24.49502,   0.00000, 0.00000, 90.00000, 17);
	CreateDynamicObject(1998, 1604.37109, -1044.08374, 22.74758,   0.00000, 0.00000, 0.00000, 17);
	CreateDynamicObject(1998, 1607.54907, -1044.06128, 22.74758,   0.00000, 0.00000, 0.00000, 17);
	CreateDynamicObject(1726, 1609.23755, -1032.96326, 22.88882,   0.00000, 0.00000, 270.00000, 17);
	CreateDynamicObject(1726, 1609.21594, -1036.56665, 22.88882,   0.00000, 0.00000, 270.00000, 17);
	CreateDynamicObject(1671, 1605.36621, -1043.99329, 23.35098,   0.00000, 0.00000, 150.00000, 17);
	CreateDynamicObject(1671, 1608.42188, -1043.99146, 23.35098,   0.00000, 0.00000, 190.00000, 17);
	CreateDynamicObject(1808, 1609.55591, -1035.74829, 22.78677,   0.00000, 0.00000, 270.00000, 17);
	CreateDynamicObject(1811, 1605.52197, -1041.78357, 23.52981,   0.00000, 0.00000, 79.94000, 17);
	CreateDynamicObject(1811, 1607.44153, -1041.84766, 23.52981,   0.00000, 0.00000, 120.00000, 17);
	CreateDynamicObject(1811, 1604.49255, -1041.82703, 23.52981,   0.00000, 0.00000, 105.00000, 17);
	CreateDynamicObject(1536, 1590.65332, -1033.39185, 22.91897,   0.00000, 0.00000, 270.00000, 17);
	CreateDynamicObject(1536, 1590.68335, -1036.41272, 22.91897,   0.00000, 0.00000, 90.00000, 17);
	CreateDynamicObject(2754, 1594.83459, -1026.02954, 23.67837,   0.00000, 0.00000, 90.00000, 17);
	CreateDynamicObject(2754, 1592.85913, -1026.02954, 23.67837,   0.00000, 0.00000, 90.00000, 17);
	CreateDynamicObject(2754, 1598.69653, -1026.02954, 23.67837,   0.00000, 0.00000, 90.00000, 17);
	CreateDynamicObject(2754, 1596.77478, -1026.02954, 23.67837,   0.00000, 0.00000, 90.00000, 17);
	CreateDynamicObject(2253, 1604.28699, -1044.23413, 23.83608,   0.00000, 0.00000, 0.00000, 17);
	CreateDynamicObject(2281, 1609.29993, -1037.64819, 24.98550,   0.00000, 0.00000, 270.00000, 17);
	CreateDynamicObject(2202, 1602.92615, -1044.01611, 22.91787,   0.00000, 0.00000, 180.00000, 17);
	CreateDynamicObject(2197, 1595.84558, -1042.99707, 22.91396,   0.00000, 0.00000, 180.00000, 17);
	CreateDynamicObject(2197, 1596.53235, -1042.99707, 22.91396,   0.00000, 0.00000, 180.00000, 17);
	CreateDynamicObject(1736, 1591.06055, -1037.19104, 25.67568,   0.00000, 0.00000, 90.00000, 17);
	CreateDynamicObject(1210, 1607.70093, -1035.66479, 23.37795,   270.00000, 65.02100, 20.00000, 17);
	CreateDynamicObject(1209, 1609.49316, -1030.83911, 22.91885,   0.00000, 0.00000, 270.00000, 17);
	CreateDynamicObject(955, 1609.53027, -1029.67847, 23.32253,   0.00000, 0.00000, 270.00000, 17);
	CreateDynamicObject(948, 1595.00098, -1044.18811, 1033.07178,   0.00000, 0.00000, 0.00000, 17);
	CreateDynamicObject(948, 1609.43628, -1039.29041, 22.92178,   0.00000, 0.00000, 0.00000, 17);
	CreateDynamicObject(3812, 1590.90527, -1026.55554, 25.76113,   0.00000, 0.00000, 0.00000, 17);
	CreateDynamicObject(3812, 1609.51538, -1043.51160, 25.76113,   0.00000, 0.00000, 180.00000, 17);
	CreateDynamicObject(1822, 1607.20105, -1036.22400, 22.92226,   0.00000, 0.00000, 0.00000, 17);
	CreateDynamicObject(948, 1597.27222, -1044.12524, 22.92178,   0.00000, 0.00000, 0.00000, 17);
	CreateDynamicObject(19377, 1605.04492, -1030.38110, 26.30251,   0.00000, 90.00000, 0.00000, 17);
	CreateDynamicObject(19377, 1605.40137, -1040.00818, 26.30251,   0.00000, 90.00000, 0.00000, 17);
	CreateDynamicObject(19377, 1594.57166, -1030.40247, 26.30251,   0.00000, 90.00000, 0.00000, 17);
	CreateDynamicObject(19377, 1594.93213, -1039.99292, 26.30250,   0.00000, 90.00000, 0.00000, 17);
	CreateDynamicObject(948, 1591.56946, -1035.07910, 1032.57239,   0.00000, 0.00000, 0.00000, 17);

	for(new i; i < sizeof(floor); i++)
		SetDynamicObjectMaterial(floor[i], 0, 18023, "genintintfastc", "dinerfloor01_128");

    // ATM
    CreateDynamicObject(19324, 1545.1654, -1770.8802, 13.1970, 0.0000, 0.0000, 90.0000); // Near City hall
	CreateDynamicObject(19324, 1102.2124, -1460.4182, 15.4615, 0.0000, 0.0000, 90.0000); // Near Hospital
	CreateDynamicObject(19324, 374.3717,  -2055.4102, 7.6778,  0.0000, 0.0000, 90.0000);
	CreateDynamicObject(19324, 2139.3962, -1164.1554, 23.6275, 0.0000, 0.0000, 90.0000);
    return 1;
}