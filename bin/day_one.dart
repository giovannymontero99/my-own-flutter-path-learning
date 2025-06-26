/**
 * Imagine you're building a blog application. You have an Article object that can have an image, an author, and a number of comments, but these could be optional (i.e., nullable).

Create an Article class with properties String? title, String? content, String? imageURL, String? author, and int? numberComments.

Create two Article instances:

One complete instance with all fields.

Another instance where imageURL and numberComments are null, and author is also null.

For the instance where imageURL and numberComments are null:

Try printing the length of imageURL using the ? operator safely.

Print the author using the ?? operator to display "Anonymous" if the author is null.

Print the numberComments using the ?? operator to display "0" if it is null.

Use an if statement to check if imageURL is present in the second instance. If not, print "This article has no featured image."
 */


class Articulo {
  String? titulo;
  String? contenido;
  String? urlImagen;
  String? autor;
  int? numeroComentario;

  Articulo({this.titulo, this.contenido, this.urlImagen, this.autor, this.numeroComentario});

}

void resolve(){
  Articulo primerArticulo = Articulo(titulo: "Hola Mundo", contenido: "This is an example content", urlImagen: "https://google.com.co",autor: "Giovanny", numeroComentario: 26);
  Articulo segundoArticulo = Articulo(titulo: "Hello World", contenido: "Otro ejemplo", urlImagen: null, autor: null, numeroComentario: null );

  String nombreSegundoAutor = segundoArticulo.autor ?? 'Anónimo';

  print(segundoArticulo.urlImagen?.length);
  print(nombreSegundoAutor);
  print(segundoArticulo.numeroComentario?? 0);

  if(segundoArticulo.urlImagen == null ){
    print("Este artículo no tiene imagen destacada.");
  }
}

/**
 * Basic Dart functions
 */

// Filter

void main() {
  List<int> numbers = [1,2,3,4,5,6];

  List<int> pairNumbers = numbers.where((number) => number % 2 == 0).toList();

  print(pairNumbers);

}




