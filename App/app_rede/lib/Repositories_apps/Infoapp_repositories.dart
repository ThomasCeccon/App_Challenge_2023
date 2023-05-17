//conectar com  externa ou banco de dados
import '../DadosApp/Infoapp.dart';

class Infoapp_repositories{
  
  static List<Infoapp>tabela=[
    Infoapp(icone:'assets/images/spotify.png', nome: 'Spotify', dados_uso: 100 ),
    Infoapp(icone:'assets/images/netflix.png', nome: 'Netflix', dados_uso: 200 ),
    Infoapp(icone:'assets/images/teams.png', nome: 'Teams', dados_uso: 300 ),
    Infoapp(icone:'assets/images/discordia.png', nome: 'Discord', dados_uso: 400 ),
    Infoapp(icone:'assets/images/cromada.png', nome: 'Google Chrome', dados_uso: 500 ),
    Infoapp(icone:'assets/images/zoom.png', nome: 'Zoom', dados_uso: 600 ),
  ];

}