<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;
use app\models\User;
use app\models\Mailer as AcmeMailer;
use yii\web\NotFoundHttpException;
use yii\helpers\ArrayHelper;


class SiteController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        $this->layout = 'simple'; //cambiar de layout
        return $this->render('index');
    }

    /**
     * Login action.
     *
     * @return Response|string
     */
    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            //return $this->goBack();//Si tuvo las credenciales le da acceso al sistema

            $this->redirect('../paises/index');
            //$this->redirect(array('private/index'));
        }

        return $this->render('login', [
            'model' => $model,
        ]);
    }


    public function actionRegister(){
        if(!Yii::$app->user->isGuest){
            return $this->goHome();
        }
        $newUser = new User();
        if ($newUser->load(Yii::$app->request->post()) && $newUser->save() && AcmeMailer::send(AcmeMailer::TYPE_REGISTRATION, $newUser)) {
            Yii::$app->session->setFlash('success', Yii::t('app', 'Registro Exitoso, por favor revisa tu correo'));
            return $this->goHome();
        }
        return $this->render('register', [
            'newUser'=> $newUser
        ]);
    }

    public function actionActivate($user, $token){
        $userToActivate = User::find()->where(['id' => $user, 'uid' => $token])->one();
        
        if(empty($userToActivate)){
            throw new NotFoundHttpException('Usuario no se encuentra');
        }
        if(!$userToActivate->activate()){
            Yii::$app->session->setFlash('error', Yii::t('app', 'Can not activate'));            
        }else{
            Yii::$app->session->setFlash('success', Yii::t('app', 'Su registro se hizo correctamente - Successfully activated'));
        }
        return $this->goHome();
    }    


    /**
     * Logout action.
     *
     * @return Response
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    /**
     * Displays contact page.
     *
     * @return Response|string
     */
    public function actionContact()
    {
        //$this->layout = 'articles'; //cambiar de layout
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->contact(Yii::$app->params['adminEmail'])) {
            Yii::$app->session->setFlash('contactFormSubmitted');

            return $this->refresh();
        }
        return $this->render('contact', [
            'model' => $model,
        ]);
    }

    public function actionCheck(){
        $users = User::find()->orderBy('id desc')->all();
        $permissions = Yii::$app->authManager->getPermissions();

        $guestUser = new User();
        $guestUser->username = 'guest';

        return $this->render('checkPermissions',[
            'users'=> ArrayHelper::merge([$guestUser], $users),
            //'users'=> $users,
            'permissions'=>$permissions,
        ]);
    }

    /**
     * Displays about page.
     *
     * @return string
     */
    public function actionAbout()
    {
        return $this->render('about');
    }

    public function actionBusqueda()
    {
        return $this->render('busqueda');
    }
}
