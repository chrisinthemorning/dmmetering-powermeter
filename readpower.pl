use Device::SerialPort 0.12;

$LOGDIR    = "/tmp";              # path to data file 
$LOGFILE   = "router.log";            # file name to output to 
$PORT      = "/dev/ttyUSB1";          # port to watch


$ob = Device::SerialPort->new ($PORT) || die "Can't Open $PORT: $!";
$ob->baudrate(9600)   || die "failed setting baudrate"; 
$ob->parity("none")    || die "failed setting parity"; 
$ob->stopbits(1)  || die "failed setting databits";

$ob->databits(8)       || die "failed setting databits"; 
$ob->handshake("none") || die "failed setting handshake"; 
$ob->write_settings    || die "no settings";

$ob->read_char_time(0);     # don't wait for each character
$ob->read_const_time(1000); # 1 second per unfulfilled "read" call
  

open(LOG,">>${LOGDIR}/${LOGFILE}") || die "can't open smdr file $LOGDIR/$LOGFILE for append: $SUB $!\n";
    
    
#    select(LOG), $| = 1;      # set nonbufferd mode
$ob->write("ACH\015");
$ob->write("ACH\012");
#$ob->write("ACH\n");
#$ob->write("ACH\r");
#$ob->write("ACH^m");

open(DEV, "<$PORT") || die "Cannot open $PORT: $_";  
           while($_ = <DEV>){        # print input device to file
           my $reading = $_;
          # $reading =~ s/\r//g;
          # $reading =~ s/A//g;
	   $reading =~ s/[^0-9]//g;
	                   print $reading / 1000 . "\n";
               }
               
$ob->write("ACH0\015");               
$ob->write("ACH0\012"); 
open(DEV, "<$PORT") || die "Cannot open $PORT: $_";
           while($_ = <DEV>){        # print input device to file
           my $reading = $_;
#           $reading =~ s/\r//g;
#           $reading =~ s/A//g;
#           print "$reading\n";
           }        
        undef $ob; 
