# Move file from download

For easier use of moving or copying file from download folder whe can utilize mv command.

  * use mv <file_path> <output_path> to Move the file that we want
  * we could also rename the desired file while doing it with giving its name at the end of output_path
  * we can use cp instead of mv if we want to copy the file and want the file to still there

---

# Let's automate creating the variable const in our asset_image

  * create scipt file 
  * give .sh file permission
  * lets create a variable that containts all the file inside our asset directory
  * create a for loop for every file in files
  * the path is still a full path we need to get the basename of the file
  * create a variable that contains the fileName without its extension
  * pascalize the file name
  * separate the file extension
  * let's create the string that we want to generate at our asset image file
  * let's add the new value in the file using sed
  * let's optimize our script by sedding only once after all is done
  * let's condition to not rewrite if the variableName alreadyExist

