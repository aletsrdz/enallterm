<?php

namespace app\models;


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
class User extends \yii\db\ActiveRecord implements \yii\web\IdentityInterface
{
    const STATUS_INSERTED = 0;
    const STATUS_ACTIVE = 1;
    const STATUS_BLOQUED = 2;


    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%user}}';

    }

    /**
     * {@inheritdoc}
     */

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
            $this->setAuthKey();  
        }        
        return parent::beforeValidate();
    }

    public function beforeSave($insert) {
        if($this->isNewRecord){
            $this->password= Yii::$app->getSecurity()->generatePasswordHash($this->password);    
        }  
        $this->update_at =  new Expression('NOW()');
        return parent::beforeSave($insert);
    }

    private function setUid(){
        $this->uid = Yii::$app->getSecurity()->generatePasswordHash(date('YmdHis').rand(1,999999));
    }

    private function setAuthKey(){
        $this->auth_key = Yii::$app->getSecurity()->generateRandomString(60);
    }

    public function activate() {
        $this->status = self::STATUS_ACTIVE;
        $this->setUid();
        return $this->save();
    }    

    public static function findByEmail($email){
        return self::findOne(['email'=>$email]);
    }

    public function validatePassword($password){
        return Yii::$app->security->validatePassword($password, $this->password);
    }

    /**
     * {@inheritdoc}
     */

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

    }

    public static function findIdentity($id){
        return self::findOne($id);

    }

    public static function findIdentityByAccessToken($token, $type = null){
        return null;
    }

    public function getId(){
        return $this->id;

    }

    public function getAuthKey(){
        return $this->auth_key;
    }

    public function validateAuthKey($authKey){
        return $this->auth_key === $authKey;

    }
}
