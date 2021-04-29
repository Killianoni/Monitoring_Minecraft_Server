<?php
    
    define( 'MQ_SERVER_ADDR', '127.0.0.1' ); // Remplacer l'ip par la votre
    define( 'MQ_SERVER_PORT', 25565 ); // Remplacer le port par le votre
    define( 'MQ_TIMEOUT', 3 );
 
    Error_Reporting( E_ALL | E_STRICT );
    Ini_Set( 'display_errors', true );
 
    require __DIR__ . '/MinecraftQuery.class.php';
 
    $Timer = MicroTime( true );
    $Query = new MinecraftQuery( );
 
    try
    {
        $Query->Connect( MQ_SERVER_ADDR, MQ_SERVER_PORT, MQ_TIMEOUT );
    }
    catch( MinecraftQueryException $e )
    {
        $Error = $e->getMessage( );
    }

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Minecraft control pannel</title>
    

    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-theme.min.css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="static/css/style.css">
    <script type="text/javascript" src="static/js/jquery-1.12.0.min.js"></script>
    <script type="text/javascript" src="static/js/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="static/js/jquery-ui-1.12.0.min.js"></script>
    <script type="text/javascript" src="static/js/script.js" ></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/png" href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA+5pVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1wTU06T3JpZ2luYWxEb2N1bWVudElEPSJ1dWlkOjY1RTYzOTA2ODZDRjExREJBNkUyRDg4N0NFQUNCNDA3IiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkI0N0JDRjhEMDY5MTExRTI5OUZEQTZGODg4RDc1ODdCIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkI0N0JDRjhDMDY5MTExRTI5OUZEQTZGODg4RDc1ODdCIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDUzYgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDowMTgwMTE3NDA3MjA2ODExODA4M0ZFMkJBM0M1RUU2NSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDowNjgwMTE3NDA3MjA2ODExODA4M0U3NkRBMDNEMDVDMSIvPiA8ZGM6dGl0bGU+IDxyZGY6QWx0PiA8cmRmOmxpIHhtbDpsYW5nPSJ4LWRlZmF1bHQiPmdseXBoaWNvbnM8L3JkZjpsaT4gPC9yZGY6QWx0PiA8L2RjOnRpdGxlPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PgFdWUIAAAExSURBVHjaxFUBEcIwDFxRMAmVMAnBQSVMAhImAQlIQAJzUBzgAByU9C7jspCsZdc7cvfHyNbPLcn/upRSVwOMiEiEW+05R4c3wznX48+T5/Cc6yrioJBNCBBpUJ4D+R8xflUQbbiwNuRrjzghHiy/IOcy4YC4svy44mTkk0KyF2Hh5S26de0i1rRoLya1RVTANyjQc065RcF45TvimFeT1vNIOS3C1xblqnRD25ZoCK8X4vs8T1z9orFYeGXYUHconI2OLswoKRbFlX5S8i9BFlK0irlAAhu3Q4F/5v0Ea8hy9diQrefB0sFoDWuRPxGPBvnKJrQCQ2uhyQLXBgXOlptCQzcdNKvwDd3UW27KhzyxgW5aQm5L8YMj5O8rLAGUBQn//+gbfvQS9jzXDuMtwAATXCNvATubRQAAAABJRU5ErkJggg==" />
 

    <style type="text/css">


    </style>
 
</head>
 
<body>
 <br>
 <br>

 
<?php if( isset( $Exception ) ): ?>
        <div class="panel panel-primary">
            <div class="panel-heading"><?php echo htmlspecialchars( $Exception->getMessage( ) ); ?></div>
            <p><?php echo nl2br( $e->getTraceAsString(), false ); ?></p>
        </div>
<?php else: ?>
        <div class="row">
            <div class="col-sm-6">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th colspan="2">Information serveur <em>(queried in <?php echo $Timer; ?>s)</em></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if( ( $Info = $Query->GetInfo( ) ) !== false ): ?>
                        <?php foreach( $Info as $InfoKey => $InfoValue ): ?>
                        <tr>
                            <td><?php echo htmlspecialchars( $InfoKey ); ?></td>
                            <td><?php
                                if( Is_Array( $InfoValue ) )
                                {
                                    echo "<pre>";
                                    print_r( $InfoValue );
                                    echo "</pre>";
                                }
                                else
                                {
                                    echo htmlspecialchars( $InfoValue );
                                }
                            ?>
                            </td>
                        </tr>
                        <?php endforeach; ?>
                        <?php else: ?>
                        <tr>
                            <td colspan="2">Pas d'informations reçues</td>
                        </tr>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>
                <div class="col-sm-6 test" >
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Joueurs</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if( ( $Players = $Query->GetPlayers( ) ) !== false ): ?>
                            <?php foreach( $Players as $Player ): ?>
                            <tr>
                                <td><?php echo htmlspecialchars( $Player ); ?></td>
                            </tr>
                            <?php endforeach; ?>
                            <?php else: ?>
                            <tr>
                                <td>Aucun joueur en ligne</td>
                            </tr>
                            <?php endif; ?>
                        </tbody>   
                    </table>
                </div>
        </div>        
<?php endif; ?>
    </div>
    
    <div class="container-fluid" id="content">

        <div id="consoleRow">
        <div class="panel panel-default" id="consoleContent">
            <div class="panel-heading">
            <h3 class="panel-title pull-left"><span class="glyphicon glyphicon-console"></span> Console</h3>
            </div>
            <div class="panel-body">
            <ul class="list-group" id="groupConsole"></ul>
            </div>
        </div>
        <div class="input-group" id="consoleCommand">

            <div id="txtCommandResults"></div>
            <input type="text" class="form-control" id="txtCommand" />
            <div class="input-group-btn">
            <button type="button" class="btn btn-primary" id="btnSend"><span class="glyphicon glyphicon-send"></span><span class="hidden-xs"> Send</span></button>

            </div>
        </div>
        </div>
    </div>

 
 
</body>
</html>