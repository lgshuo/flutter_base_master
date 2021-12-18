class BaseRequest{
   Map<String,String>params = Map();
   BaseRequest add(String key,dynamic value){
    params[key]=value.toString();
    return this;
  }

}