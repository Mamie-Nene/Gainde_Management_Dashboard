

class ApiUrl{

  //              ---------------------- Const Var ----------------------

  static const String baseUrl='https://api.guichetuniqueservices.com/backendhelpdesk';


  //              ---------------------- Get token Var ----------------------

  String getTokenForLoginSUPPORT='$baseUrl/user/logingupdashbord';

  String getCurrentUserSUPPORT='$baseUrl/user/login';

  String getTokenForLoginDOUANE='https://api.guichetuniqueservices.com/backenddouane/user/login';

  String getTokenForLoginPORT='https://api.guichetuniqueservices.com/backendport/user/login';
 // String getTokenForLoginPORT='https://gupe-partenaire.gainde2000.sn/backendport/user/login';

  String getTokenForLoginInfinityStats='https://gupe-partenaire.gainde2000.sn/infinitystatbackend/user/login';


  //              ---------------------- Statistic Var ----------------------


  String getTotalData='$baseUrl/demandes/statistics';

  String getTotalDataForStatistics='$baseUrl/demandes/statistiqueperiodique';

  String getStatsByConteneurByConsignataire='$baseUrl/articles/conteneurs-by-consignataire';

  String getDossierEnlevementEntreDate='$baseUrl/demandes/dossiers-du-periode';


  //              ---------------------- Manutentionnaire Var ----------------------

  String getListMannu='$baseUrl/demandes/grouped-by-manu';

  String getListMannuByYearUniqueOrYearAndMonth='/backendhelpdesk/demandes/distribution-by-manutentionnaire';

  String getCountForEachMannu='$baseUrl/demandes/count-by-manutentionnaire';

  static const String httpsUrlForQuerr='api.guichetuniqueservices.com'; //prod


  //              ---------------------- Consignataire Var ----------------------

  String getVolumetriePeriodiqueBadWithoutDate ='$baseUrl/suivi-statistiquePeriode/rechercher';


  //              ---------------------- PAD Var ----------------------


  String getVisaPADUrl='$baseUrl/demandes/findAllFolderPerformance';

  String getAvarnavUrl='https://gateway.guichetuniqueservices.com/backendgateway/avarnavs/searchAvarnav';

  String getAvarnavUrl2='https://gateway.guichetuniqueservices.com/backendgateway/avarnavs/liste';

  //              ---------------------- Manifeste Var ----------------------

  String getListManifest='$baseUrl/manifestes/latest';

  String getListManifestCargo='$baseUrl/manifestes/get-manifeste-cargo';

  String getManifestCargoByRepertoire='$baseUrl/manifestes/get-segment-general';


  //           ----------------------- BRIGADE Var --------------------------

  String getListVisaDuJour='$baseUrl/api/enregistrement-brigade/search-by-date';

  String getListVisaEntreDate='$baseUrl/api/enregistrement-brigade/search-by-date-range';

  String getListSortieDuJour='$baseUrl/api/conteneurs/search';

  String getListSortieEntreDate='$baseUrl/api/conteneurs/search-range';

  String getListSortieBrigadeByActeurEntreDate='$baseUrl/api/conteneurs/between-dates';

  // ---------------------- analyse bl -----------------------

  String getStatisticcAnalyseBL = '$baseUrl/articles/statistics';



  // ---------------------- infinity stats ----------------------------

  //String getStatsGlobalForManifestConteneurAndDossie='https://gupe-partenaire.gainde2000.sn/infinitystatbackend/statistique-manifestes';

  String getStatsByTypeEnlevement='https://gupe-partenaire.gainde2000.sn/infinitystatbackend/statistique-dossiers-enelevement';

  String getNbreManifestByCngt='https://gupe-partenaire.gainde2000.sn/infinitystatbackend/api/stat-manifestes/consignataire-manifestes-count';

  String getNbreArticleByCngt='https://gupe-partenaire.gainde2000.sn/infinitystatbackend/api/stats-connaissements/histogram-data';

  // ------------------- IPMD --------------------
  String getTokenForLoginIPMD='https://gupe-partenaire.gainde2000.sn/backendIpmd/api/auth/signin';

  String getTotalDossierEnlevementByMonthIPDM ='https://gupe-partenaire.gainde2000.sn/backendIpmd/volumetrie-dossier/weekly-data-de';
}