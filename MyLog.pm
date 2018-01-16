use strict;
use warnings;
use Log::Log4perl;
use Log::Dispatch::FileRotate;

my $info_log_file  = "log/mylog.log";

sub initialize_log {
  my $log_conf = "(
  log4perl.category.infologger = TRACE, InfoLogAppender

  log4perl.appender.InfoLogAppender = Log::Dispatch::FileRotate
  log4perl.appender.InfoLogAppender.filename = ${info_log_file}
  log4perl.appender.InfoLogAppender.mode = append
  log4perl.appender.InfoLogAppender.max = 5
  log4perl.appender.InfoLogAppender.DatePattern = yyyy-MM-dd-HH-MM 
  log4perl.appender.InfoLogAppender.min_level = debug
  log4perl.appender.InfoLogAppender.layout = Log::Log4perl::Layout::PatternLayout
  log4perl.appender.InfoLogAppender.layout.ConversionPattern = [%d] [%M] - %m%n
  )";

  Log::Log4perl::init(\$log_conf);

  return 1;
}

sub main {
  my $info_logger  = Log::Log4perl->get_logger('infologger');
  $info_logger->error("logging an error");
  $info_logger->warn("logging a warning");
  $info_logger->info("logging an info");
  $info_logger->debug("logging a debug msg");
  $info_logger->trace("logging a trace msg");
}

initialize_log();
main();

