#############################################################################
##
#W  init.g                   ACE Package                     Alexander Hulpke
#W                                                                Greg Gamble
##
#H  @(#)$Id$
##

##  Announce the package version and test for the existence of the binary

ACEPackageVersion := function()
  local versionfile, version;
  versionfile := Filename( DirectoriesPackageLibrary("ace", ""), "VERSION" );
  version := StringFile(versionfile);
  return version{[1..Length(version) - 1]};
end;

DeclarePackage( "ace", ACEPackageVersion(),
  function()
    # Check that the version no. of GAP is ok.
    if not(IsBound( CompareVersionNumbers ) and 
           CompareVersionNumbers( VERSION, "4.3" )) then
      Info(InfoWarning, 1,
           "Package ``ACE'' ACEPackageVersion(): requires at least GAP 4.3");
      return false;
    fi;
    # Test for existence of the compiled binary
    if Filename(DirectoriesPackagePrograms("ace"), "ace") = fail then
      Info(InfoWarning, 1,
           "Package ``ace'': The program `ace' is not compiled");
      return fail;
    fi;
    return true;
  end
);

##  Install the documentation
DeclarePackageAutoDocumentation( "ace", "doc" );

#############################################################################
##
#R  Read the actual code.
##
ReadPkg( "ace", "gap/general.gd" );
ReadPkg( "ace", "gap/interact.gd" );
ReadPkg( "ace", "gap/streams.gd" );
ReadPkg( "ace", "gap/options.gd" );
ReadPkg( "ace", "gap/ace.g" );

#E init.g . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
