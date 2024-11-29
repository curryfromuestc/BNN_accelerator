#!/usr/bin/env python
# coding: utf-8
# vim: tabstop=4 expandtab shiftwidth=4 softtabstop=4
MERGED=True
cssMergedString = """ 
.top_message {
    /*float:right;*/
    width:100%;
    clear:right;
    font-weight:bold;
    margin-left:60px;
}

.message {
    clear:both;
    margin-left:60px;
}

.shortLogMessages {
    clear:both;
    margin-left:60px;
}

.inner_wrapper{
    margin-left:60px;
}

.inner_message {
    width:100%;
    clear:both;
}

.expandTab {
    width:60px;
    min-width:40px;
    color:Green;
    text-align:left;
    background-color:Transparent; 
    cursor:pointer;
    float:left;
    clear:left;
    z-index:2;
}

.warningTag {
    font-weight:Bold;
    color:#F88017;
    background-color:Transparent; 
}
.errorTag {
    font-weight:Bold;
    background-color:Transparent; 
    color:Red;
}
.informationTag {
    font-weight:Bold;
    color:#0070C0;
    background-color:Transparent; 
}

.suprisinglyComplicatedPlusSign{
    font-weight:Bolder;
    /*z-index:1;*/
    /*font-family:"Sans Serif"*/
}

body {
    font-family:"Lucida Console", Monaco, monospace;
    font-size:14px;
}


/*The following is for the summary table*/

table {
    width:100%;
   /* border:1px solid black; */
}

th, td {
    border:1px solid black; 
    text-align:center;
    vertical-align:text-top;
}


"""

jsMergedString = """ 

 function toggleDiv(divId) { 
   var item = document.getElementById(divId);
   if(item.style.display == "none") {
       item.style.display = "block"; 
   }
   else {
       item.style.display = "none";
   }
 }
 
function makeTopHeader(count,divId,cssClass,type) { 
    var headDiv = document.getElementById(type+'Head_'+divId);
    var tabDiv = document.getElementById("expandTab_"+type+"Head_"+divId);
    headDiv.className=cssClass;
   
    countString = count == 0 ? "" : "(" + count + ")";

    if (count != 0)
        var newHtml = " <span class='suprisinglyComplicatedPlusSign'>+<\\/span>" + countString;
    else
        var newHtml = " [<span class='suprisinglyComplicatedPlusSign'>+<\\/span>]" + countString;

    tabDiv.innerHTML = newHtml;
}

function toggleTopHeader(divId,type)
{
    var body = document.getElementById(type+"Body_"+divId);
    var expandTab = document.getElementById("expandTab_"+type+"Head_"+divId);
    var header = document.getElementById(type+"Head_"+divId);
    if(body.style.display == "none") {
       header.style.fontWeight = "normal"
       expandTab.innerHTML = expandTab.innerHTML.replace("+","-");
       body.style.display = "block"; 
    }
    else {
       expandTab.innerHTML = expandTab.innerHTML.replace("-","+");
       header.style.fontWeight = "bold"
       body.style.display = "none";
    }
}

function changeExpandTab(divId,newState,color) { 
    var tab = document.getElementById("expandTab_treeHead_"+divId);
    tab.style.color = color;
}

// Internet explorer detection:
// Obtained from: http://msdn.microsoft.com/en-us/library/ms537509%28v=vs.85%29.aspx 

function getInternetExplorerVersion()
// Returns the version of Internet Explorer or a -1
// (indicating the use of another browser).
{
  var rv = -1; // Return value assumes failure.
  if (navigator.appName == 'Microsoft Internet Explorer')
  {
    var ua = navigator.userAgent;
    var re  = new RegExp("MSIE ([0-9]{1,}[\\.0-9]{0,})");
    if (re.exec(ua) != null)
      rv = parseFloat( RegExp.$1 );
  }
  return rv;
}
function checkVersion()
{
  var ver = getInternetExplorerVersion();

  if ( ver > -1 )
  {
    if ( ver < 8.0 )
    { 
      message = 'In order to provide the best results it is recommended to use one of the latest browsers, e.g.:\\n';
      message +='      - Mozilla Firefox\\n';
      message +='      - Google Chrome\\n';
      message +='      - MS Internet Explorer 8 or newer, but without compability view\\n';
 
      alert(message);
    }
  }
}

checkVersion()
"""



###############################################################################
###############################################################################
#
# Copyright 2011 Synopsys, Inc. All rights reserved
#
# FILE NAME:    log.cgi
# AUTHOR:       Juan Besa 
#
# ABSTRACT: Generates an HTML version of an output log.
#
# Version 0     Creation
# Version 0.1   Patch for files beggining with '+'
# Version 0.1.1 Added support for unbalanced '+' and changed CSS 
# Version 0.1.2 Added coloring for main log. Corrects '+' sign errors.
# Version 0.2   Changed Css. Added support for nesting and propagating errors.
#               Remove color from information. Fixed tabbing.
#               Improved '+' signs.
#               Added link to summary
# Version 0.2.1 Added warning support for shell Log
# Version 0.2.2 Added test suppport. Solved unclosed '+' problem
# Version 0.2.3 Fixed lots of '+' issues. Added several test cases.
# Version 0.2.4 Added support for inbeded headers. Improved +- cases
# Version 0.2.5 Added support for incorrect line numberings
# Version 0.2.6 Tihomir Sokcevic: Version info
###############################################################################

VERSION = "0.2.6 <Python3.0"
import cgi
import sys
import re
import string

DIRECTORY = ""  #Use to select directory with log and sidefiles
SUM_FILE = "./sum.cgi"

def worker():
    """Main function holds almost all of the code to process a log
    
    This function exists mainly to add a level between the merged code 
    and this main file.
    """
    
    #Start Gobal Variables ----------------------------------------------------
    
    iniFileName = DIRECTORY + r"DC_log_snapshot.ini"
    LOG_NAME = DIRECTORY + "DC_log_snapshot.log"

    global SUM_FILE
    if MERGED:
        SUM_FILE = "./summary.cgi"
    
    files = [];
    sideMessages = [];
    types = ["Error","Warning","Information"]
    summaryCounts = {}
    for type in types:
        summaryCounts[type] = {}

    errorSummary = {}
    warnSummary = {}
    infoSummary = {}

    messageRegExpr_string =r"""
        ^(?P<type> Error|Information|Warning|Severe|Fatal):             # The message type
        (?P<message>.+)                                                 # The message
        \( (?P<tag>[a-zA-Z]+\-[0-9]+) \)$                               # The message tag
        """ 
    messageRegExpr = re.compile(messageRegExpr_string,re.IGNORECASE|re.VERBOSE)

    
    TAB_SIZE = 4 #Determines number of spaces with which we represent an incoming tab
    TAB = ""
    for i in range(TAB_SIZE):
        TAB += "&nbsp;"

    EMPTY_TITLE_FILLER = ""

    #End Gobal Variables -----------------------------------------------------

    #Start DEBUG VARIABLES ---------------------------------------------------
    DEBUG = False 
    SHOW_ALL = False #No collapsing messags (does maintain indentation) 
    
    DISPLAY = "none" 
    if SHOW_ALL:
        DISPLAY = "block"
    #End DEBUG VARIABLES ------------------------------------------------------

    def loadFiles():
        "Loads file name from base directory"
        try:
            ini = open(iniFileName);
            fileNames = []
            for line in ini:
                fileNames.append(DIRECTORY + line[:-1]); #Removes trailing \n
            ini.close()
                
            for fileName in fileNames:
                try:
                    files.append(sideFile(fileName))
                except IOError, (errno, strerror):
                     pass

            #Removes unopened files
            badFile = []
            for file in files:
                if file.lineNumber == -1:
                    badFile.append(file)
            for file in badFile:
                removeFile(file)
            
            files.sort()

        except IOError, (errno, strerror):
            print "I/O error(%s): %s %s" % (errno, strerror, iniFileName)
                
    def removeFile(file):
        file.close()
        files.remove(file)

    def __stringToHTML(line):
        """ Please do not use, use stringToHTML or matchToHTML instead"""
        line = string.replace(line,"&","&amp;")
        line = string.replace(line," ","&nbsp;")
        line = string.replace(line,"\\n","<br>")
        line = string.replace(line,"\t",TAB)
        return line
    
    def stringToHTML(line):
        return __stringToHTML(line) + "<br>"

    def matchToHTML(match):
        type = match.group("type")
        tag = match.group("tag")
        if type == "Warning" or type == "Error" or type == "Information":
            stringType = "<span class='" + type.lower() + "Tag'> " + type + " </span>"
            stringTag =  "<span class='" + type.lower() + "Tag'>(" + tag +  ")</span>"
        else:
            stringType = type
            stringTag = "(" + tag + ")"

        message = match.group("message")

        return  stringType + ":" + __stringToHTML(message) + stringTag + "<br>"

    class sideFile:
        """ Holds a sideFile. Essentially read a side file maintaining the last
        line and processing the line number"""
        
        def __init__(self,fileName):
            self.fileName = fileName    
            self.file = open(fileName)
            self.lineNumber = 0    #Holds the number to which the nextLine corrolates.
                                   #Is -1 if we reached the EOF
            self.depth = 0         #Holds the current depth (due to '+' signs)
            self.nextLine = ""
            self.ids = 0        #Number of ids generated to make unique ids. 
            self.ignoreCount = 0
            self.advanceLine() 
            
        def __cmp__(self,o):
            """ To compare we use the line number to which this is corrolated"""
            if self.lineNumber < o.lineNumber:
                return -1
            elif self.lineNumber > o.lineNumber:
                return 1
            else:
                return 0
        
        def advanceLine(self):
            """ Advances and processes the line. Updating the line number"""
            if self.ignoreCount > 0:
                self.ignoreCount -= 1
                return

            try:
                nextLine = self.file.readline().strip()
                if nextLine:
                    if nextLine[0] != '+' and nextLine[0] != '-':
                        tabPos = nextLine.find("\t")
                        if tabPos != -1:
                            self.lineNumber = int(nextLine[:tabPos])
                            self.lastLine = nextLine[tabPos:]
                            match = messageRegExpr.match(self.lastLine.strip())
                            if match:
                                type = match.group("type")
                                tag = match.group("tag")
                                if summaryCounts[type].has_key(tag):
                                    summaryCounts[type][tag] += 1
                                else:
                                    summaryCounts[type][tag] = 1
                        else:
                            raise Exception("Error in sidefile " + self.fileName  \
                            + " with (relative to mainLog) line number "          \
                            + str(self.lineNumber) + " <br>\nThe line is:\n" + nextLine)
                    else:
                        self.lastLine = nextLine
                        tabPos = nextLine.find("\t")
                        if tabPos != -1:
                            self.lineNumber = int(nextLine[1:tabPos])
                        else:
                            self.lineNumber = int(nextLine[1:])

                        if self.lastLine[0] == '+':
                            self.depth += 1
                        else:
                            self.depth -= 1
                            if self.depth <= 0: 
                                self.depth = 0
                else:
                    self.lineNumber = -1
            except Exception, inst:
                print "Error in side file " + self.fileName + "\n<br>"
                print inst
                sys.exit(1)

        def close(self):
            self.file.close()
            while self.depth > 0:
                print "<!--unbalanced '-' signs in " + self.fileName + "--> </div>"
                self.depth -= 1

        def toString(self):
            return str(self.lineNumber) + " " + self.fileName + " " + self.lastLine + "<br>"
        
        def getLastLine(self):
            return self.lastLine.strip()

        def getUniqueId(self):
            id = self.ids;
            self.ids += 1
            return self.fileName + "_" + str(self.lineNumber) + "_" + str(id)

        def ignoreNextGet(self):
            self.ignoreCount += 1

    def istr(int):
        if int < 10000:
            return str(int)
        elif int < 1000000:
            return str(int/1000) + "k"
        else:
            return str(int/1000000) + "M"

    class worstStateStack:
        """ Hold the current state to allow upwards propagation of errors and warnings through different
        levels of the tree (i.e. '+' ==> go down a level '-' ==> go up a level"""

        __types = dict({"Error":1,"Warning":2,"Information":3,"Message":4}) #Type->Priority Lower is higher priority
        __minType = "Message"
        __propagatedState = __types["Warning"]
        
        def __init__(self):
            self.stateStack = []    #Holds pairs of state,Id,changed value of state
            self.stateStack.append( (self.__minType,"Body",False) )# Bottom of the stack(the top level) 
                                                                   # is always the min state

        def stepDown(self,pusherDivId):
            myState = self.__top()[0]
            self.stateStack.append((self.__minType,pusherDivId,False))

        def stepUp(self):
            if self.__depth() > 1:
                (innerState,myId,changed) = self.stateStack.pop()
                if changed:
                    self.__changeStateHTML(myId,innerState)
                self.updateState(innerState) #Propagate up

        def updateState(self,type):
            """ Only updates the state if we are not at the top level (depth == 1) 
                in that case we update with higher priority states"""

            inPriority = self.__priority(type)
            if (self.__depth() > 1 
              and inPriority <  self.__priority(self.__top()[0]) 
              and inPriority <= self.__propagatedState):
                tempId = self.__top()[1]
                self.stateStack[len(self.stateStack)-1] = (type,tempId,True)
            
        def __depth(self):
            return len(self.stateStack)

        def __top(self):
            if self.stateStack:
                return  self.stateStack[len(self.stateStack)-1]
            else:
                return None;
    
        def __priority(self,type):
            return self.__types[type]
    
        def __changeStateHTML(self,myId,innerState):
            #This should probably be done with the CSS
            if innerState == "Warning":
                color = "Orange"
            else:
                color = "Red"
            
            print '<SCRIPT type="text/JavaScript">\n'
            print   "changeExpandTab('"+myId+"','"+innerState+"','"+color+"');\n"
            print "</SCRIPT>"
            
    errorPropagator = worstStateStack() 
    
    class messageGroup:
        """ Hold a group of the messages,informations or errors

        A message is considered to be of the same group if is has the same tag.
        Each group is associated with a unique divId"""
        def __init__(self,match,divId):
            self.matchList = []
            self.matchList.append(match)
            self.divId = divId + "_" + match.group("tag")
            self.cssClass = match.group("type").lower() #All css classes are lowercase

        def addLine(self,match):
            self.matchList.append(match);

        def printHTML(self):
            if not self.matchList or len(self.matchList) == 0:
                return

            self.matchList.reverse()

            print "<div id='warningHeadWrapper_" +self.divId + "'>"
            print "<div" + \
                    " id='expandTab_warningHead_"+self.divId+ "'"+ \
                    " onClick='toggleTopHeader(" + '"' + self.divId + '","warning"' + ")'"+\
                    " class='expandTab'>" + \
                    " </div>";
            print   "<div id='warningHead_" +self.divId + "' class='message'>"
            print       matchToHTML(self.matchList.pop())
            print   "</div>"
            print "</div>"
            
            if len(self.matchList) > 0:
                count = len(self.matchList)+1
                print "<div class='inner_wrapper' id='warningBody_" + self.divId + "' style='display:"+DISPLAY+";' >";
                print   "<div class='inner_message'>"
                while len(self.matchList) > 0:
                    print       matchToHTML(self.matchList.pop())
                print   "</div>"
                print "</div>"
               
                if not SHOW_ALL:
                    print '<SCRIPT type="text/JavaScript">\n'
                    print "makeTopHeader('" + istr(count) +"','"+self.divId+"','top_message','warning');\n"
                    print "</SCRIPT>"

    class MessageGroupBuffer:
        def __init__(self):
            self.__buffer = {}

        def add(self,match,divId):
            tag = match.group("tag")
            if self.__buffer.has_key(tag):
                self.__buffer[tag].addLine(match)
            else:
                newGroup = messageGroup(match,divId)
                self.__buffer[tag] = newGroup

        def flush(self):
            if self.__buffer:
                #Print this blocks html
                for wGroup in self.__buffer:
                    self.__buffer[wGroup].printHTML()
                #And clear the list
                self.__buffer = {}

        def __nonzero__(self):
            if self.__buffer:
                return True
            else:
                return False

        def __len__(self):
            return len(self.__buffer)

    def processMessages(file, dumpRest):
        """ Processes messagess in sidefile file. Dump rest is a flag to 
        ignore line numbers, if false will only process the lines of the 
        current line number of the side file.
        """
        
        currentNumber = file.lineNumber 
        groupBuffer = MessageGroupBuffer()

        divId = file.getUniqueId()
        lineCount = 0
        
        while (currentNumber >= file.lineNumber or dumpRest == True) and file.lineNumber != -1:
            line = file.getLastLine()

            extraPlus = False

            if line[0] == '+':
                innerDivId = file.getUniqueId()

                #Tree header
                tabPos = line.find("\t")
                if tabPos == -1:
                    cameWithHeader = False
                    title = EMPTY_TITLE_FILLER
                else:
                    cameWithHeader = True
                    title = line[tabPos:]

                file.advanceLine()
                header = file.getLastLine()
                onlyALine = False
                #Reached end of file. We simply ignore the '+'
                if file.lineNumber == -1:
                    continue
                #Empty '+' '-' we ignore the plus and carry on
                elif file.lineNumber <= currentNumber and header[0] == '-':
                    file.advanceLine()
                    continue
                #We have a '+' lines from somewhere else '-'  We add the header and continue
                elif header[0] == '-':
                    header = title
                #Nested plus we add a level. 
                elif header[0] == '+':
                    header = title
                elif file.lineNumber > currentNumber:
                    header = title
                else:
                    if cameWithHeader:
                        onlyALine = False
                        header = title
                    else:
                        onlyALine = True

                groupBuffer.flush()
                divId = file.getUniqueId()

                print "<div id='treeHeadWrapper_"+innerDivId+"'>" 
                print "<div" + \
                        " id='expandTab_treeHead_"+innerDivId+ "'"+ \
                        " onClick='toggleTopHeader(" + '"' + innerDivId + '","tree"' + ")'"+\
                        " class='expandTab'>" + \
                      " </div>";
                print   "<div id='treeHead_"+innerDivId+"' class='message'>"
                match = messageRegExpr.match(header.strip())
                if match:
                    print matchToHTML(match)
                else:
                    print stringToHTML(header.strip())
                print   "</div>"
                print "</div>"

                if onlyALine:
                    #To eliminate an expanding one line message we check the the next line is
                    #a '-' sign and if we haven't changed lines if it is we don't need to expand
                    #at this point we will have advances two lines beyond the + sign
                    file.advanceLine()
                    nextLine = file.getLastLine()
                    if file.lineNumber != -1 and (file.lineNumber != currentNumber or nextLine[0] != '-'):
                        print '<SCRIPT type="text/JavaScript">\n'
                        print "makeTopHeader('0','"+innerDivId+"','top_message','tree');\n"
                        print "</SCRIPT>"
                        #Tree body
                        errorPropagator.stepDown(innerDivId) 
                        print "<div id='treeBody_"+innerDivId +"' style='display:"+DISPLAY+"' class='inner_wrapper'>"
                    else:
                        file.advanceLine() #Skip the '-' or the end of file
                    continue #Because we already advanced the line we skip to the next iteration 
                else:
                    #We know there is something between this + and it's -
                    print '<SCRIPT type="text/JavaScript">\n'
                    print "makeTopHeader('0','"+innerDivId+"','top_message','tree');\n"
                    print "</SCRIPT>"
                    #Tree body
                    errorPropagator.stepDown(innerDivId) 
                    print "<div id='treeBody_"+innerDivId +"' style='display:"+DISPLAY+"' class='inner_wrapper'>"
                    # Now we leave and wait for our linenumber to come up
                    extraPlus += 1
                    lineCount += 1
                    continue

            elif line[0] == '-':
                errorPropagator.stepUp()
                groupBuffer.flush()
                print "</div>"

            else:
                lineCount += 1
                match = messageRegExpr.match(line.strip())
                if match:
                    groupBuffer.add(match,divId)
                    errorPropagator.updateState(match.group("type"))
                else:
                    groupBuffer.flush()
                    print "<div class='shortLogMessages'>"
                    print stringToHTML(line)
                    print "</div>"
                    divId = file.getUniqueId()

            file.advanceLine()

        groupBuffer.flush()

        if file.lineNumber == -1:
            #Reached the end of the file
            file.close()
        else:
            #Reinsert in files in it's correct position
            j = 0
            inserted = False
            while j < len(files):
                if files[j] >= file:
                    files.insert(j,file)
                    inserted = True
                    break
                j += 1

            if not inserted:
                files.append(file)

        if DEBUG:
            print "<br><br><br><br><br><br>";

            for swa in files:
                print swa.toString()

        return lineCount
    # End process messages            
    
    def printHeaders():
        if MERGED:
            print '<script type="text/javascript">' + jsMergedString + '</script>\n'
            print '<style type="text/css">' + cssMergedString + '</style>\n'
        else:
            print '<script type="text/javascript" src="html_logger.js"></script>\n'
            print '<link rel="stylesheet" type="text/css" href="html_logger.css" />\n'

    def run():
        """ Main function. Process main log and includes side file messages
        when necessary"""
        
        print '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"' 
        print '"http://www.w3.org/TR/html4/strict.dtd">'
        print '<html>'
        print '<head>'
        print   '<title>'
        print       'HTML Logger v. ' + VERSION
        print   '</title>'
        printHeaders()
        print '</head>'

        print '<body>'
        loadFiles()

        try:
            shortLog = open(LOG_NAME)
            groupBuffer = MessageGroupBuffer()

            i = 1;
            divId = "shortLogMessageGroup_" + str(i)
            print "<div class='shortLogMessages'>"
            for line in shortLog:
                while len(files) > 0 and i >= files[0].lineNumber:
                    print "</div>"
                    if groupBuffer:
                        groupBuffer.flush()
                        divId = "shortLogMessageGroups_" + str(i)

                    processMessages(files.pop(0), False)
                    print "<div class='shortLogMessages'>"

                match = messageRegExpr.match(line)
                if match:
                    type = match.group("type")
                    tag = match.group("tag")
                    groupBuffer.add(match,divId)
                    if summaryCounts[type].has_key(tag):
                        summaryCounts[type][tag] += 1
                    else:
                        summaryCounts[type][tag] = 1
                else:
                    if groupBuffer:
                        print "</div>"
                        groupBuffer.flush()
                        print "<div class='shortLogMessages'>"
                        divId = "shortLogMessageGroup_" + str(i)
                    print stringToHTML(line)

                i += 1
            print "</div>"

            shortLog.close()

            while len(files) > 0:
                processMessages(files.pop(0), True)
            
            for file in files:
                file.file.close()
        except IOError, (errno, strerror):
            print "I/O error(%s): %s" % (errno, strerror)
        
        #The log ends here. The following is and appendix for the summary
        
        print "<br> <A href='" + SUM_FILE + "'> To summary </A> <br>"

        #Calculate Counts
        summaryTypeCounts = {}
        for type in types:
            summaryTypeCounts[type] = 0
            for tag,count in summaryCounts[type].iteritems():
                summaryTypeCounts[type] += count

        print "<table>"
        #Summary Table Header
        print   "<tr>"
        for type in types:
            print   "<th> <A href='" + SUM_FILE + "#" + type + "'>" + \
                        type + "s("+ str(summaryTypeCounts[type]) + ")</A></th>"
        print   "</tr>"
        #Summary Table Body
        print   "<tr>"
        for type in types:
            print   "<td>"
            tags = summaryCounts[type].keys()
            tags.sort()
            for tag in tags:
                print "<A href='" + SUM_FILE + "#" + tag + "'>" + \
                    tag + "(" + str(summaryCounts[type][tag] ) + ")</A><br>"
            print   "</td>"
        print   "</tr>" 
        print "</table>"
        print "</body>"
        print "</html>"

    run()

def main():
    """ Wrapper to allow for python errors. This way you don't get a server
    error (most of the time) """
    
    print 'Content-type: text/html\n\n'
    try:
        if len(sys.argv) > 1:
            diff = ""
            if len(sys.argv) == 3 and sys.argv[2] == "-d":  
                print "Entering Test Diff Mode. Currently only tests HTML Logger"
                diff = "_diff"
            elif len(sys.argv) == 2:
                print "Entering Test Diff Mode. Currently only tests HTML Logger"
            else:
                print "Error wrong number of arguments"
                print "Usage:\n python log.cgi directoryFile [-d]"

            try:
                dirFile = open(sys.argv[1])
                for testDirectory in dirFile:
                    testDirectory = testDirectory.strip()
                    print "writing to " + testDirectory
                    try:
                        global DIRECTORY
                        global SUM_FILE
                        if testDirectory[-1] == '/':
                            DIRECTORY = testDirectory
                            resultDirectory = DIRECTORY
                            htmlFile = open(resultDirectory + testDirectory[:-1] + diff + ".html", 'w')
                        else:
                            DIRECTORY = testDirectory + "/"
                            resultDirectory = DIRECTORY
                            htmlFile = open(resultDirectory + testDirectory + diff + ".html", 'w')
                        print DIRECTORY
                        sys.stdout = htmlFile 
                        worker()
                        sys.stdout = sys.__stdout__
                        htmlFile.close()
                    except IOError, (errno, strerror):
                        print "I/O error(%s): %s %s" % (errno, strerror, testDirectory)
            except IOError, (errno, strerror):
                print "I/O error(%s): %s %s" % (errno, strerror, testDirectory)
                print "Could not open test file"
        else:
            worker()
    except:
        print "Logger version: " + VERSION
        print sys.version
        print "<!-- --><hr><h1>Oops an error ocurred.</h1>"
        cgi.print_exception() #Prints traceback safely

main();

