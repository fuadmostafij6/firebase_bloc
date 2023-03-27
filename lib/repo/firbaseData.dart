
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


}