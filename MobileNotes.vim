UIKit Classes
-------------
NSObject -> UIResponder -> UIViewController -> UITableViewController
                        -> UIView -> UIScrollView -> UITableView
         -> FileManager
	 -> Bundle

UIViewController - data type that is Apple's default screen type; a blank white screen

UITableViewController - data type that shows rows of data that can be scrolled and selected

FileManager - a convenient interface to the contents of the file system, and the primary means
	      of interacting with it; a file manager object lets you examine the contents of the
	      file system and make changes to it; the FileManager class provides convenient access
	      to a shared file manager object that is suitable for most types of file-related
	      manipulations; a file manager object is typically your primary mode of interaction
	      with the file system; you use it to locate, create, copy, and move files and directories;
	      you also use it to get information about a file or directory or change some of its attributes

	      Instantiate a new FileManager object like this:

	      	let fm = FileManager.default
		// FileManager object returned will look something like: "<NSFileManager: 0x600003cf8000>\n"

Bundle - a representation of the code and resources stored in a bundle directory on disk; Apple uses bundles
	 to represent apps, frameworks, plug-ins, and many other specific types of content; bundles organize
	 their contained resources into well-defined subdirectories, and bundle structures vary depending on
	 the platform and the type of the bundle; by using a bundle object, you can access a bundle's
	 resources without knowing the structure of the bundle; the bundle object provides a single interface
	 for locating items, taking into account the bundle structure, user preferences, available localizations,
	 and other relevant factors; any executable can use a bundle object to locate resources, either inside
	 an app’s bundle or in a known bundle located elsewhere; you don't use a bundle object to locate files
	 in a container directory or in other parts of the file system; the general pattern for using a bundle
	 object is as follows:

	 1. Create a bundle object for the intended bundle directory

	 	let path = Bundle.main.resourcePath!
		// resourcePath returns an optional String - a file path, i.e., /some/path/etc
		// String is optional because not all bundles have a resource path
		// but this is iOS and iOS main bundles will *always* have a resource path
		// thus, we are able to confidently force unwrap and don't need to write
		// optional unwraping code

	 2. Use the methods of the bundle object to locate or load the needed resource

		let items = try! fm.contentsOfDirectory(atPath: path)
		// returns an array of Strings - items in the path, i.e., filenames, dirs,
		// symlinks; does a shallow search of the directory so does not traverse
		// symlinks or display contents of any dirs; will return files beginning
		// with ., i.e., .viminfo, but does not return "." or ".." or resource
		// forks (files beginning with ._); the order of the files in the returned
		// array is undefined
		//
		// contentsOfDirectory is a throwing function so we must use "try":
		//
		//	func contentsOfDirectory(atPath path: String) throws -> [String]
		//
		// saying here try to read the contents of our resource path and since we're
		// using an implicitly unwraped optional ("try!") the program will crash if
		// there is nothing in the resource path - but, if there truly is nothing in
		// the resource path, something is fundamentally broken in our application;
		// this should never happen so it's OK here to implicitly unwrap

	 3. Use other system APIs to interact with the resourc


Methods
-------
viewDidLoad - called by UIKit when the scteen has loaded
