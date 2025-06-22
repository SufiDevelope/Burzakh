abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(String url);

  Future<dynamic> getPostApiResponse(String url, dynamic data, bool image);

  Future<dynamic> getPutApiResponse(String url, dynamic data, bool image);
  
  Future<dynamic> getdeleteApiResponse(String url);
}