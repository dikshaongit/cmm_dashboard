 class coachinfo
 {
    String  coach_number;
    String  depot;
    String  division;
    String  workshop;
    String  built_date; 
    String  manufacturer; 
    String  owning_rly; 
    String coach_type;
    String  maint_zone; 
    String  coach_age ; 
    String  coach_category; 
    String  coach_ac_flag ; 
    String  vehicle_type ; 
    String  return_date ; 


   coachinfo.fromjson(Map<String,dynamic>json)
  {
    coach_number = json['coach_number']; 
    if(coach_number==null)
    coach_number=" ";
    depot = json['depot']; 
    if(depot==null)
    depot=" ";
    division = json['division']; 
    if(division==null)
    division=" ";
    workshop = json['workshop']; 
    if(workshop==null)
    workshop=" ";
    built_date = json['built_date']; 
    if(built_date==null)
    built_date=" ";
    manufacturer = json['manufacturer']; 
    if(manufacturer==null)
    manufacturer=" ";
    owning_rly = json['owning_rly']; 
    if(owning_rly==null)
    owning_rly=" ";
    coach_type=json['coach_type'];
    if(coach_type==null)
    coach_type=" ";
    maint_zone = json['maint_zone']; 
    if(maint_zone==null)
    maint_zone=" ";
    coach_age = json['coach_age']; 
    if(coach_age==null)
    coach_age=" ";
    coach_category = json['coach_category']; 
    if(coach_category==null)
    coach_category=" ";
    coach_ac_flag = json['coach_ac_flag']; 
    if(coach_ac_flag==null)
    coach_ac_flag=" ";
    vehicle_type = json['vehicle_type']; 
    if(vehicle_type==null)
    vehicle_type=" ";
    return_date = json['return_date']; 
    if(return_date==null)
    return_date=" ";
   
  }
 }