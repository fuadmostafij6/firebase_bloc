
import 'package:firbase/Const/GoogleServices.dart';
import 'package:firbase/model/post.dart';

class FirebaseServices{


 Future<List<PostModel>?> get()async{

List <PostModel> post =[];
  await GoogleHelper.fireBaseStore.collection("post").get().then((value){

   for (var element in value.docs) {
     PostModel postModel = PostModel(
         title: element["title"],
         desc: element["desc"],
         postId: element["postId"],
         subcat: element["subcat"]
     );
    post.add(postModel);


   }

  });
  return post;

  }

  Future post(Map<String, dynamic> data)async{
   var docId = DateTime.now().microsecondsSinceEpoch.toString();
    await GoogleHelper.fireBaseStore.collection("post").doc(docId).set(data);

  }

 Future update(Map<String, dynamic> data, String docId)async{
   await GoogleHelper.fireBaseStore.collection("post").doc(docId).update(data);

 }
 Future delete(String docId)async{
   await GoogleHelper.fireBaseStore.collection("post").doc(docId).delete();

 }

}