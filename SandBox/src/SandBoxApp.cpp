#include <GameEngine.h>

#include "ImGui/imgui.h"

class ExampleLayer : public GameEngine::Layer
{
public :
	ExampleLayer()
		: Layer("Example")
	{
	}

	void OnUpdate() override
	{
		//GE_CLIENT_INFO("ExampleLayer::Update");
		if (GameEngine::Input::IsKeyPressed(GE_KEY_TAB))
			GE_CLIENT_INFO("Tab key is pressed");
	}

	void OnEvent(GameEngine::Event& event) override
	{
		if (event.GetEventType() == GameEngine::EventType::KeyPressed)
		{
			GameEngine::KeyPressedEvent& e = (GameEngine::KeyPressedEvent&)event;
			GE_CLIENT_TRACE("{0}",(char)e.GetKeyCode());
		}
		//GE_CLIENT_TRACE("{0}", event);
	}
};

class Sandbox : public GameEngine::Application
{
public :
	Sandbox()
	{
		PushLayer(new ExampleLayer());
	}

	~Sandbox()
	{

	}
};

GameEngine::Application* GameEngine::CreateApplication()
{
	return new Sandbox();
}