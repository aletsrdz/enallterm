<?php
namespace app\commands;
use app\models\User;
use Yii;
use yii\console\Controller;
/**
* Class RbacController.
* @package app\commands
*/
class RbacController extends Controller
{
	 public function actionInit()
	 {
		 $auth= Yii::$app->authManager;
		 try{

		 	$auth->removeAll();	

		 	$createPais = $auth->createPermission('createPais');
		 	$createPais->description = 'Crear pais';
		 	$updatePais = $auth->createPermission('updatePais');
		 	$updatePais->description = 'Actualizar pais';
		 	$deletePais = $auth->createPermission('deletePais');
		 	$deletePais->description = 'Borrar pais';
		 	$readPais = $auth->createPermission('readPais');
		 	$readPais->description = 'Leer pais';

		 	$createAreas = $auth->createPermission('createAreas');
		 	$createAreas->description = 'Crear Areas';
		 	$updateAreas = $auth->createPermission('updateAreas');
		 	$updateAreas->description = 'Actualizar Areas';
		 	$deleteAreas = $auth->createPermission('deleteAreas');
		 	$deleteAreas->description = 'Borrar Areas';
		 	$readAreas = $auth->createPermission('readAreas');
		 	$readAreas->description = 'Leer Areas';

		 	$createSubareas = $auth->createPermission('createSubareas');
		 	$createSubareas->description = 'Crear Subareas';
		 	$updateSubareas = $auth->createPermission('updateSubareas');
		 	$updateSubareas->description = 'Actualizar Subareas';
		 	$deleteSubareas = $auth->createPermission('deleteSubareas');
		 	$deleteSubareas->description = 'Borrar Subareas';
		 	$readSubareas = $auth->createPermission('readSubareas');
		 	$readSubareas->description = 'Leer Subareas';		 	

		 	//add permissions

		 	$auth->add($createPais);
		 	$auth->add($updatePais);
		 	$auth->add($deletePais);
		 	$auth->add($readPais);

		 	$auth->add($createAreas);
		 	$auth->add($updateAreas);
		 	$auth->add($deleteAreas);
		 	$auth->add($readAreas);

		 	$auth->add($createSubareas);
		 	$auth->add($updateSubareas);
		 	$auth->add($deleteSubareas);
		 	$auth->add($readSubareas);		 	

		 	//create Superadmin role

		 	$superadmin = $auth->createRole('super');
		 	$auth->add($superadmin);
		 	$auth->addChild($superadmin, $deletePais);
			$auth->addChild($superadmin, $deleteAreas);
			$auth->addChild($superadmin, $deleteSubareas);	

			//create Admin role

			$admin = $auth->createRole('admin');
			$auth->add($admin);

			$auth->addChild($superadmin, $admin); //admin es hijo de superadmin

			$auth->addChild($admin, $createPais);
			$auth->addChild($admin, $updatePais);	 			
			$auth->addChild($admin, $readPais);
			$auth->addChild($admin, $createAreas);
			$auth->addChild($admin, $updateAreas);	 			
			$auth->addChild($admin, $readAreas);			
			$auth->addChild($admin, $createSubareas);
			$auth->addChild($admin, $updateSubareas);	 			
			$auth->addChild($admin, $readSubareas);



			/*

			 $createPost = $auth->createPermission('createPost');
			 $createPost->description = 'Create a post';
			 $updatePost = $auth->createPermission('updatePost');
			 $updatePost->description = 'Update a post';
			 $updatePost = $auth->createPermission('updatePost');
			 $updatePost->description = 'Update a post';
			 $deletePost = $auth->createPermission('deletePost');
			 $deletePost->description = 'Delete a post';
			 $readPost = $auth->createPermission('readPost');
			 $readPost->description = 'Read a post';
			 $authorRule = new \app\rbac\AuthorRule();
			 // add permissions
			 $auth->add($createPost);
			 $auth->add($updatePost);
			 $auth->add($deletePost);
			 $auth->add($readPost);
			 $auth->add($authorRule);
			 // add the "updateOwnPost" permission and associate the rule with it.
			 $updateOwnPost = $auth->createPermission('updateOwnPost');
			 $updateOwnPost->description = 'Update own post';
			 $updateOwnPost->ruleName = $authorRule->name;
			 $auth->add($updateOwnPost);
			 $auth->addChild($updateOwnPost, $updatePost);
			  // create Author role
			 $author = $auth->createRole('author');
			 $auth->add($author);
			 $auth->addChild($author, $createPost);
			 $auth->addChild($author, $updateOwnPost);
			 $auth->addChild($author, $readPost);
			 // create Admin role
			 $admin = $auth->createRole('admin');
			 $auth->add($admin);
			 $auth->addChild($admin, $updatePost);
			 $auth->addChild($admin, $deletePost);
			 $auth->addChild($admin, $author);

			 */
			 // assign roles
			 $auth->assign($superadmin, User::findByUsername('alexrdz')->id);// se cambio findByUsername por findByEmail
			 $auth->assign($admin, User::findByUsername('tere')->id);
			 $auth->assign($admin, User::findByUsername('iona')->id);
			 echo "Done!\n";
			}catch(yii\console\Exception $e){
				throw new $e;
			} 
 	}

}