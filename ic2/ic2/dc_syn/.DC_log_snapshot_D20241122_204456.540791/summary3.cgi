#!/usr/bin/env python
# coding: utf-8
# vim: tabstop=4 expandtab shiftwidth=4 softtabstop=4
MERGED=True
cssMergedString = """ 

table {
    width:100%;
   /* border:1px solid black; */
}

th, td {
    border:1px solid black; 
    text-align:center;
    vertical-align:text-top;
}

.typeDiv {
    border:1px solid black;
    padding:7px 7px 13px;
}

h1 {
    margin-top:3px;
"""



###############################################################################
###############################################################################
#
# Copyright 2011 Synopsys, Inc. All rights reserved
#
# FILE NAME:    summary.cgi
# AUTHOR:       Juan Besa 
#
# ABSTRACT: Generates a summary of an HTML version of an output log.
#
# Version 0     Creation
# Version 0.1   Added link to main log
# Version 0.2   Tihomir Sokcevic: Version info
#
###############################################################################

VERSION = "0.2 >=Python3.0"
import cgi
import sys
import re
import string


def worker():
    DIRECTORY = ""  #Use to select directory with log and sidefiles
    iniFileName = DIRECTORY + r"DC_log_snapshot.ini"
    LOG_NAME = DIRECTORY + "DC_log_snapshot.log"

    LOG_FILE = "./html_logger.cgi"
    if MERGED:
        LOG_FILE = "./log.cgi"

    files = [];
    sideMessages = [];
    messages = {}
    messageCount = {}
    typeCounts = {}
    tagCounts = {}
    
#DEBUG VARIABLES
    DEBUG = False 
    SHOW_ALL = False #No collapsing messags (does maintain indentation) 
    
    DISPLAY = "none" 
    if SHOW_ALL:
        DISPLAY = "block"
#END DEBUG VARIABLES

    messageRegExpr_string =r"""
               ^(?P<type> Error|Information|Warning|Severe|Fatal)                   # The message type
               :.+                                                                  # The message
                \( (?P<tag>[a-zA-Z]+\-[0-9]+) \)$                                   # The message tag
               """ 
    messageRegExpr = re.compile(messageRegExpr_string,re.IGNORECASE|re.VERBOSE)
    TAB_SIZE = 4
    TAB = ""
    for i in range(TAB_SIZE):
        TAB += "&nbsp;"

    def loadFiles():
        "Loads file name from base directory"
        try:
            ini = open(iniFileName);
            fileNames = []
            for line in ini:
                fileNames.append(DIRECTORY + line[:-1]); #Removes trailing \n
            ini.close()
                
            fileNames.sort()
            for fileName in fileNames:
                try:
                    files.append(open(fileName))
                except IOError as xxx_todo_changeme:
                     (errno, strerror) = xxx_todo_changeme.args
                     pass
            #files.sort(key=filename)

        except IOError as xxx_todo_changeme1:
            (errno, strerror) = xxx_todo_changeme1.args
            print("I/O error(%s): %s" % (errno, strerror))
                
    def removeFile(file):
        file.close()
        files.remove(file)

    def toHTML(line):
        line = line.replace("&","&amp;")
        line = line.replace(" ","&nbsp;")
        line = line.replace("\\n","<br>")
        line = line.replace("\t",TAB)
        return line + "<br>"

    def processLine(line):
        line = line.strip()
        match = messageRegExpr.match(line)
        if match:
            tag = match.group("tag")
            type = match.group("type")
            typeCounts[type] += 1
            
            if tag not in messages[type]:
                messages[type][tag] = {}
                messages[type][tag][match.group(0)] = 1
                tagCounts[type+tag] = 1
            else:
                if match.group(0) not in messages[type][tag]:
                    messages[type][tag][match.group(0)] = 1
                else:
                    messages[type][tag][match.group(0)] += 1
                tagCounts[type+tag] += 1
    
    def printHeaders():
        if MERGED:
            print('<style type="text/css">' + cssMergedString + '</style>\n')
        else:
            print('<link rel="stylesheet" type="text/css" href="sum.css" />\n')

    def run():
        print('<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"') 
        print('"http://www.w3.org/TR/html4/strict.dtd">')
        print('<html>')
        print('<head>')
        print('<title>')
        print('HTML Logger Summary v. ' + VERSION)
        print('</title>')
        printHeaders()
        print('</head>')

        print('<body>')
        loadFiles()

        types = ["Error","Warning","Information"]

        try:
            for type in types:
                messages[type] = {}
                typeCounts[type] = 0

            shortLog = open(LOG_NAME)
            
            for line in shortLog:
                processLine(line)

            for file in files:
                for line in file:
                    tabPos = line.find("\t")
                    if tabPos > 0:
                        processLine(line[tabPos:])

            print("<A name='top'> </A>")
            print("<A href='" + LOG_FILE + "'> Back to complete log </A> <br>")
            print("<table>")
            #Header
            print("<tr>")
            for type in types:
                print("<th> <A href='#" + type + "'>" + type + "s("+ str(typeCounts[type]) + ")</A></th>")
            print("</tr>")
            #Body
            print("<tr>")

            #Order tags alphabetically
            orderedMessages = {}
            for type in types:
                orderedTags = list(messages[type].keys())
                orderedTags.sort()
                orderedMessages[type] = orderedTags

            for type in types:
                print("<td>")
                for tag in orderedMessages[type]:
                    print("<A href='#" + tag + "'>" + tag + "(" + str(tagCounts[type+tag]) + ")</A><br>")
                print("</td>")
            print("</tr>") 
            print("</table>")
            
            for type in types:
                print("<div class='typeDiv'> <h1> <A name='" + type + "'>" + type + "s: </A> </h1>")
                for tag in orderedMessages[type]:
                    print("<div class='tagDiv'> <h2> <A name='" + tag + "'>" + tag + " </A> </h2>")
                    for line,count in messages[type][tag].items():
                        print("("+str(count)+") "+toHTML(line))
                    print("<A href='#top'> Back to top </A> <br>")
                    print("</div>")
                print("</div>")
            print("<A href='" + LOG_FILE + "'> Back to complete log </A> <br>")
            
            shortLog.close()

            for file in files:
                file.close()
        except IOError as xxx_todo_changeme2:
            (errno, strerror) = xxx_todo_changeme2.args
            print("I/O error(%s): %s" % (errno, strerror))
        
        print("<br>")
        
        print('</body>')
        print('</html>')
    run()
#End of worker

def main():
    print('Content-type: text/html\n\n')
    try:
        worker()
    except:
        print("Summary version: " + VERSION)
        print(sys.version)
        print("<!-- --><hr><h1>Oops an error ocurred.</h1>")
        cgi.print_exception() #Prints traceback safely

main();



