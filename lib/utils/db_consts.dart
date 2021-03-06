
//Shared constants
const String ID = 'id';
const String UID = 'uid';
const String ACTIVE = 'active'; //used to determine if a file is active or deleted
const String ARCHIVE = 'archive'; //used to determine if log is shown or not
const String CURRENCY_NAME = 'currency';
const String CATEGORY = 'category';
const String SUBCATEGORY = 'subcategory';
const String CATEGORIES = 'categories';
const String SUBCATEGORIES = 'subcategories';
const String NAME = 'name';
const String PARENT_CATEGORY_ID = 'parentCategoryId';
const String DEFAULT_CATEGORY = 'defaultCategory';
enum CategoryOrSubcategory {category, subcategory}
enum SettingsLogEntry {settings, log, entry}
enum TagCollectionType {entry, category, log}
//TODO implement filtering later
//enum GroupBy {day, week, month, year}
//enum FilterBy {none, all, category, subcategory, tag}


//Log constants
const String LOG_COLLECTION = 'logs';
const String ENTRIES = 'entries';
const String LOG_NAME = 'logName';
const String MEMBER_ROLES_MAP = 'rolesList';
const String MEMBERS = 'members';
const String OWNER_OR_WRITER = 'ownerOrWriter';
const String OWNER = 'owner';
const String WRITER = 'write';

//Entry constants
const String ENTRY_COLLECTION = 'entries';
const String LOG_ID = 'logId';
const String ENTRY_NAME = 'entryName';
const String ENTRY_MEMBERS = 'entryMembers';
const String ENTRY_MEMBER = 'entryMember';
const String AMOUNT = 'amount';
const String COMMENT = 'comment';
const String LOCATION = 'location';
const String DATE_TIME = 'dateTime';
enum PaidOrSpent {paid, spent}


//Members constants
const String AMOUNT_MY_CURRENCY = 'amountInMyCurrency';
const String PAID = 'paid';
const String SPENT = 'spent';



//Tags constants
const String TAG_COLLECTION = 'tags';
const String TAGS = 'tags';
const String TAG = 'tag';
const String TAG_LOG_FREQUENCY = 'tagLogFrequency';
const String TAG_CATEGORY_FREQUENCY = 'tagCategoryFrequency';


//Account constants
const String PHOTO_URL = 'photoUrl';
const String EMAIL = 'email';
const String MEMBER_NAME = 'memberName';


//UI constants
const double EMOJI_SIZE = 22.0;


