<?php

namespace app\models;

<<<<<<< HEAD
class User extends \yii\base\BaseObject implements \yii\web\IdentityInterface
{
    public $id;
    public $username;
    public $password;
    public $authKey;
    public $accessToken;

    private static $users = [
        '100' => [
            'id' => '100',
            'username' => 'admin',
            'password' => 'admin',
            'authKey' => 'test100key',
            'accessToken' => '100-token',
        ],
        '101' => [
            'id' => '101',
            'username' => 'demo',
            'password' => 'demo',
            'authKey' => 'test101key',
            'accessToken' => '101-token',
        ],
    ];

=======
use Yii;
use yii\db\Expression;


/**
 * This is the model class for table "{{%user}}".
 *
 * @property int $id
 * @property string $uid
 * @property string $username
 * @property string $email
 * @property string $password
 * @property int $contact_email
 * @property int $contact_phone
 * @property bool $status
 * @property string $created_at
 * @property string $update_at
 */
class User extends \yii\db\ActiveRecord
{
    const STATUS_INSERTED = 0;
    const STATUS_ACTIVE = 1;
    const STATUS_BLOQUED = 2;
>>>>>>> 85c56bbb38ad2d778d1dffd9fd093aa6e7942d40

    /**
     * {@inheritdoc}
     */
<<<<<<< HEAD
    public static function findIdentity($id)
    {
        return isset(self::$users[$id]) ? new static(self::$users[$id]) : null;
=======
    public static function tableName()
    {
        return '{{%user}}';
>>>>>>> 85c56bbb38ad2d778d1dffd9fd093aa6e7942d40
    }

    /**
     * {@inheritdoc}
     */
<<<<<<< HEAD
    public static function findIdentityByAccessToken($token, $type = null)
    {
        foreach (self::$users as $user) {
            if ($user['accessToken'] === $token) {
                return new static($user);
            }
        }

        return null;
    }

    /**
     * Finds user by username
     *
     * @param string $username
     * @return static|null
     */
    public static function findByUsername($username)
    {
        foreach (self::$users as $user) {
            if (strcasecmp($user['username'], $username) === 0) {
                return new static($user);
            }
        }

        return null;
    }

    /**
     * {@inheritdoc}
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * {@inheritdoc}
     */
    public function getAuthKey()
    {
        return $this->authKey;
=======
    public function rules()
    {
        return [
            [['uid','username', 'email', 'password'], 'required'],
            [['status','contact_email', 'contact_phone'], 'integer'],
            [['email'], 'email'],
            [['created_at', 'update_at'], 'safe'],
            [['uid', 'password'], 'string', 'max'=>60],
            [['username'], 'string', 'max'=>45],
            [['email'], 'string', 'max'=>255],
            [['uid'], 'unique'],
            [['email'], 'unique'],
        ];
    }

    public function beforeValidate() {
        if($this->isNewRecord){
            $this->setUid();    
        }        
        return parent::beforeValidate();
    }

    public function beforeSave($insert) {
        if($this->isNewRecord){
            $this->password= Yii::$app->getSecurity()->generatePasswordHash($this->password);    
        }  
        $this->update_at =  new Expression('NOW()');
        return parent::beforeValidate();
    }

    private function setUid(){
        $this->uid = Yii::$app->getSecurity()->generatePasswordHash(date('YmdHis').rand(1,999999));
>>>>>>> 85c56bbb38ad2d778d1dffd9fd093aa6e7942d40
    }

    /**
     * {@inheritdoc}
     */
<<<<<<< HEAD
    public function validateAuthKey($authKey)
    {
        return $this->authKey === $authKey;
    }

    /**
     * Validates password
     *
     * @param string $password password to validate
     * @return bool if password provided is valid for current user
     */
    public function validatePassword($password)
    {
        return $this->password === $password;
=======
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'uid' => 'Uid',
            'username' => 'Username',
            'email' => 'Email',
            'password' => 'Password',
            'contact_email' => 'Contact Email',
            'contact_phone' => 'Contact Phone',
            'status' => 'Status',
            'created_at' => 'Created At',
            'update_at' => 'Update At',
        ];
>>>>>>> 85c56bbb38ad2d778d1dffd9fd093aa6e7942d40
    }
}
