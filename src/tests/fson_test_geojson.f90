program fsonGeojsonRead
use fson
use fson_value_m
implicit none
integer*4 i,j,k
integer*4 no_data,no_geodata
character(256) geometry_type
type(fson_value), pointer :: json_data,data, array, array2,array3, item,features,coords
real*8, allocatable:: xycoords(:,:)
real*8 x,y

json_data => fson_parse('GeojsonTEST.json')

call fson_get(json_data, "features", features)
no_data=fson_value_count(features)
do i = 1, no_data
  item => fson_value_get(features, i)
  call fson_get(item, "geometry.type", geometry_type)
  call fson_get(item, "geometry.coordinates", coords)
  call fson_get(item, "geometry.coordinates", xycoords)
  no_data=fson_value_count(coords)
end do



end