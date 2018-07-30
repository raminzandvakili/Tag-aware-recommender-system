function loading( done, total, message )
    % prints a loading message on screen
    loaded = floor( ( done / total ) * 100 );
    fprintf( 'LOADING! %s %d%%\n', message, loaded );
end